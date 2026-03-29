#!/bin/bash
set -e

echo "=== OJS Local Restore ==="

# 1. Build and start containers
echo "[1/7] Starting containers..."
docker compose up -d --build

# 2. Wait for DB to be healthy
echo "[2/7] Waiting for database..."
until docker inspect --format='{{.State.Health.Status}}' ojs-db 2>/dev/null | grep -q "healthy"; do
  sleep 2
  echo "  ...waiting"
done
echo "  DB is healthy."

# 3. Import database dump
echo "[3/7] Importing database dump (utf8mb4)..."
docker cp data/ojs_dump.sql ojs-db:/tmp/ojs_dump.sql
docker exec ojs-db sh -lc "mariadb --default-character-set=utf8mb4 -u ojs -pojs_secure_pass_2026 ojs < /tmp/ojs_dump.sql && rm -f /tmp/ojs_dump.sql"

# 4. Restore files
echo "[4/7] Restoring files..."
docker exec ojs-journal sh -lc "rm -rf /var/www/files/* /var/www/html/public/*"

docker cp data/ojs_private_files.tar.gz ojs-journal:/tmp/
docker exec ojs-journal sh -c 'cd /var/www/files && tar xzf /tmp/ojs_private_files.tar.gz && rm /tmp/ojs_private_files.tar.gz'

docker cp data/ojs_public_files.tar.gz ojs-journal:/tmp/
docker exec ojs-journal sh -c 'cd /var/www/html/public && tar xzf /tmp/ojs_public_files.tar.gz && rm /tmp/ojs_public_files.tar.gz'

# 5. Copy local config (SSL off, localhost)
echo "[5/7] Copying local config..."
docker cp config/ojs.config.local.inc.php ojs-journal:/var/www/html/config.inc.php

# 6. Apply journal bootstrap for TIL ZHANE KOGAM
echo "[6/7] Applying journal bootstrap..."
docker cp sql/bootstrap_til_kogam.sql ojs-db:/tmp/bootstrap_til_kogam.sql
docker exec ojs-db sh -lc "mariadb --default-character-set=utf8mb4 -u ojs -pojs_secure_pass_2026 ojs < /tmp/bootstrap_til_kogam.sql && rm -f /tmp/bootstrap_til_kogam.sql"

# Ensure local custom.css exists in public files (if present in repo)
if [ -f custom.css ]; then
  docker cp custom.css ojs-journal:/var/www/html/public/journals/1/custom.css
fi

# 7. Clear cache and restart app
echo "[7/7] Clearing cache and restarting app..."
docker exec ojs-journal sh -lc "find /var/www/html/cache -type f -delete"
docker restart ojs-journal >/dev/null

echo ""
echo "=== Done! ==="
echo "Open: http://localhost:8081/journal"
echo "Login: admin / AdApTo_J0urnal_2026!"
