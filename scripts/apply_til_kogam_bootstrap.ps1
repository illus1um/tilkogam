param(
  [string]$DbContainer = "ojs-db",
  [string]$AppContainer = "ojs-journal",
  [string]$DbName = "ojs",
  [string]$DbUser = "ojs",
  [string]$DbPassword = "ojs_secure_pass_2026",
  [string]$SqlFile = "sql/bootstrap_til_kogam.sql"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $SqlFile)) {
  throw "SQL file not found: $SqlFile"
}

Write-Host "[1/4] Copy SQL to DB container..."
docker cp $SqlFile "$DbContainer`:/tmp/bootstrap_til_kogam.sql"

Write-Host "[2/4] Apply SQL (utf8mb4)..."
docker exec $DbContainer sh -lc "mariadb --default-character-set=utf8mb4 -u $DbUser -p$DbPassword $DbName < /tmp/bootstrap_til_kogam.sql"

Write-Host "[3/4] Clear OJS cache..."
docker exec $AppContainer sh -lc "find /var/www/html/cache -type f -delete"

Write-Host "[4/4] Restart app container..."
docker restart $AppContainer | Out-Null

Write-Host ""
Write-Host "Bootstrap applied successfully."
Write-Host "Open: http://localhost:8081/journal"
