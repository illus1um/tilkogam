# OJS Handoff: ТІЛ ЖӘНЕ ҚОҒАМ (TIL ZHANE KOGAM)

Репозиторий для локального запуска OJS 3.4 и базовой реализации журнала `ТІЛ ЖӘНЕ ҚОҒАМ`.

## Что уже реализовано

- Базовый запуск OJS + MariaDB через `docker compose`
- В образ добавлена тема `pragma` (чтобы стиль не исчезал после пересборки)
- SQL bootstrap для журнала в 3 языках: `kk`, `ru`, `en`
- Настроены ключевые параметры журнала (локали, разделы, контакты, workflow)
- Скрипты восстановления с безопасным импортом БД в `utf8mb4` (без проблемы `????`)

## Важные папки/файлы

- `docker-compose.yml` — контейнеры OJS и MariaDB
- `Dockerfile` — образ OJS + bundled тема `pragma`
- `sql/bootstrap_til_kogam.sql` — стартовая конфигурация журнала
- `scripts/restore_local.ps1` — полный restore для Windows/PowerShell
- `restore.sh` — полный restore для Linux/macOS (bash)
- `themes/pragma/` — тема OJS, включена в репозиторий

## Перед запуском

Для полного восстановления нужны локальные backup-файлы (они игнорируются git):

- `data/ojs_dump.sql`
- `data/ojs_private_files.tar.gz`
- `data/ojs_public_files.tar.gz`
- `config/ojs.config.local.inc.php`

## Быстрый старт (Windows, рекомендовано)

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\restore_local.ps1
```

## Быстрый старт (Linux/macOS)

```bash
chmod +x ./restore.sh
./restore.sh
```

После завершения:

- URL: `http://localhost:8081/journal`
- Логин: `admin`
- Пароль: `AdApTo_J0urnal_2026!`

## Применить только bootstrap (без полного restore)

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\apply_til_kogam_bootstrap.ps1
```

Это обновит настройки журнала (`name/about/sections/locales/footer` и т.д.) в существующей базе.

## Примечания по DOI

В текущем MVP DOI выключен (`enableDois=0`).
Включение DOI возможно позже после выбора регистратора (например Crossref/DataCite), оплаты и настройки плагинов/депозитов.

## Текущий статус MVP

- Рабочая локальная версия журнала на OJS
- 3 языка интерфейса/контента
- Структура разделов и редакционные настройки под `ТІЛ ЖӘНЕ ҚОҒАМ`
- Основа для дальнейшего наполнения выпусками и статьями
