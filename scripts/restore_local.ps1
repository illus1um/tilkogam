param(
  [string]$DbContainer = "ojs-db",
  [string]$AppContainer = "ojs-journal",
  [string]$DbName = "ojs",
  [string]$DbUser = "ojs",
  [string]$DbPassword = "ojs_secure_pass_2026",
  [string]$DumpFile = "data/ojs_dump.sql",
  [string]$PrivateFilesArchive = "data/ojs_private_files.tar.gz",
  [string]$PublicFilesArchive = "data/ojs_public_files.tar.gz",
  [string]$LocalConfig = "config/ojs.config.local.inc.php",
  [string]$BootstrapSql = "sql/bootstrap_til_kogam.sql"
)

$ErrorActionPreference = "Stop"

function Assert-FileExists {
  param([string]$Path)

  if (-not (Test-Path -LiteralPath $Path)) {
    throw "Required file not found: $Path"
  }
}

Assert-FileExists -Path $DumpFile
Assert-FileExists -Path $PrivateFilesArchive
Assert-FileExists -Path $PublicFilesArchive
Assert-FileExists -Path $LocalConfig
Assert-FileExists -Path $BootstrapSql

Write-Host "=== OJS Local Restore (PowerShell) ==="

Write-Host "[1/7] Starting containers..."
docker compose up -d --build

Write-Host "[2/7] Waiting for DB health..."
$startedAt = Get-Date
while ($true) {
  $status = docker inspect --format='{{.State.Health.Status}}' $DbContainer 2>$null
  if ($status -eq "healthy") {
    break
  }

  if (((Get-Date) - $startedAt).TotalSeconds -gt 240) {
    throw "DB container '$DbContainer' did not become healthy in time."
  }

  Write-Host "  ...waiting"
  Start-Sleep -Seconds 2
}
Write-Host "  DB is healthy."

Write-Host "[3/7] Importing database dump (utf8mb4)..."
docker cp $DumpFile "$DbContainer`:/tmp/ojs_dump.sql"
docker exec $DbContainer sh -lc "mariadb --default-character-set=utf8mb4 -u $DbUser -p$DbPassword $DbName < /tmp/ojs_dump.sql && rm -f /tmp/ojs_dump.sql"

Write-Host "[4/7] Restoring public/private files..."
docker exec $AppContainer sh -lc "rm -rf /var/www/files/* /var/www/html/public/*"

docker cp $PrivateFilesArchive "$AppContainer`:/tmp/ojs_private_files.tar.gz"
docker exec $AppContainer sh -lc "cd /var/www/files && tar xzf /tmp/ojs_private_files.tar.gz && rm -f /tmp/ojs_private_files.tar.gz"

docker cp $PublicFilesArchive "$AppContainer`:/tmp/ojs_public_files.tar.gz"
docker exec $AppContainer sh -lc "cd /var/www/html/public && tar xzf /tmp/ojs_public_files.tar.gz && rm -f /tmp/ojs_public_files.tar.gz"

if (Test-Path -LiteralPath "custom.css") {
  docker exec $AppContainer sh -lc "mkdir -p /var/www/html/public/journals/1"
  docker cp "custom.css" "$AppContainer`:/var/www/html/public/journals/1/custom.css"
}

Write-Host "[5/7] Copying local config..."
docker cp $LocalConfig "$AppContainer`:/var/www/html/config.inc.php"

Write-Host "[6/7] Applying TIL ZHANE KOGAM bootstrap SQL..."
docker cp $BootstrapSql "$DbContainer`:/tmp/bootstrap_til_kogam.sql"
docker exec $DbContainer sh -lc "mariadb --default-character-set=utf8mb4 -u $DbUser -p$DbPassword $DbName < /tmp/bootstrap_til_kogam.sql && rm -f /tmp/bootstrap_til_kogam.sql"

Write-Host "[7/7] Clearing cache and restarting app container..."
docker exec $AppContainer sh -lc "find /var/www/html/cache -type f -delete"
docker restart $AppContainer | Out-Null

Write-Host ""
Write-Host "=== Done ==="
Write-Host "Open: http://localhost:8081/journal"
Write-Host "Login: admin / AdApTo_J0urnal_2026!"
