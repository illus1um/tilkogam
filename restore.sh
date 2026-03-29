#!/bin/bash
set -e

echo "=== OJS Local Restore ==="

# 1. Build and start containers
echo "[1/5] Starting containers..."
docker compose up -d --build

# 2. Wait for DB to be healthy
echo "[2/5] Waiting for database..."
until docker inspect --format='{{.State.Health.Status}}' ojs-db 2>/dev/null | grep -q "healthy"; do
  sleep 2
  echo "  ...waiting"
done
echo "  DB is healthy."

# 3. Import database dump
echo "[3/5] Importing database dump..."
docker exec -i ojs-db mariadb -u ojs -pojs_secure_pass_2026 ojs < data/ojs_dump.sql

# 4. Restore files
echo "[4/5] Restoring files..."
docker cp data/ojs_private_files.tar.gz ojs-journal:/tmp/
docker exec ojs-journal sh -c 'cd /var/www/files && tar xzf /tmp/ojs_private_files.tar.gz && rm /tmp/ojs_private_files.tar.gz'

docker cp data/ojs_public_files.tar.gz ojs-journal:/tmp/
docker exec ojs-journal sh -c 'cd /var/www/html/public && tar xzf /tmp/ojs_public_files.tar.gz && rm /tmp/ojs_public_files.tar.gz'

# 5. Copy local config (SSL off, localhost)
echo "[5/5] Copying local config..."
docker cp config/ojs.config.local.inc.php ojs-journal:/var/www/html/config.inc.php

echo ""
echo "=== Done! ==="
echo "Open http://localhost:8081"
echo "Login: admin / AdApTo_J0urnal_2026!"
