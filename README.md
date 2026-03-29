# OJS Journal — Handoff Package

Полный прод-бэкап Open Journal Systems (OJS 3.4.0) для journal.adapto.kz.
Дата снятия дампа: **2026-03-17**.

## Что внутри

```
├── Dockerfile              # OJS image (pkpofficial/ojs:stable-3_4_0 + mod)
├── docker-compose.yml      # OJS + MariaDB 10.11
├── config/
│   └── ojs.config.inc.php  # Конфиг OJS (БД, email, security)
├── custom.css              # Кастомные стили журнала
├── setup_content.sql       # Начальный контент (редколлегия, about, privacy)
├── ADMIN_CREDENTIALS.md    # Логины и пароли
├── data/
│   ├── ojs_dump.sql        # Полный дамп MariaDB (все таблицы, данные, юзеры)
│   ├── ojs_private_files.tar.gz  # /var/www/files (загруженные статьи, рецензии)
│   └── ojs_public_files.tar.gz   # /var/www/html/public (публичные файлы)
```

## Быстрый запуск (с нуля)

### 1. Поднять контейнеры

```bash
docker compose up -d --build
```

Дождаться пока MariaDB станет healthy:
```bash
docker compose ps   # db должен быть "healthy"
```

### 2. Залить дамп БД

```bash
docker exec -i ojs-db mariadb -u ojs -pojs_secure_pass_2026 ojs < data/ojs_dump.sql
```

### 3. Восстановить файлы

Приватные файлы (статьи, рецензии):
```bash
docker exec ojs-journal sh -c 'rm -rf /var/www/files/*'
docker cp data/ojs_private_files.tar.gz ojs-journal:/tmp/
docker exec ojs-journal sh -c 'cd /var/www/files && tar xzf /tmp/ojs_private_files.tar.gz && rm /tmp/ojs_private_files.tar.gz'
```

Публичные файлы:
```bash
docker cp data/ojs_public_files.tar.gz ojs-journal:/tmp/
docker exec ojs-journal sh -c 'cd /var/www/html/public && tar xzf /tmp/ojs_public_files.tar.gz && rm /tmp/ojs_public_files.tar.gz'
```

### 4. Скопировать конфиг

```bash
docker cp config/ojs.config.inc.php ojs-journal:/var/www/html/config.inc.php
```

### 5. Проверить

Открыть http://localhost:8081 — должен загрузиться OJS.

## Если ставишь на свой домен

1. В `config/ojs.config.inc.php` поменяй `base_url` на свой домен
2. В `config/ojs.config.inc.php` поменяй `allowed_hosts`
3. Если без HTTPS — убери `force_ssl = On` и `force_login_ssl = On`
4. В `docker-compose.yml` можно сменить порт (сейчас `8081:80`)

## Пароли

См. `ADMIN_CREDENTIALS.md`. После развёртывания **смени пароли**:
- Админ OJS: через веб-интерфейс (Profile → Change Password)
- БД: в `docker-compose.yml` и `config/ojs.config.inc.php`
