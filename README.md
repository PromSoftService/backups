# Backup через restic

## 1. Настроить

Открой:

```text
restic.env.cmd
```

Проверь/измени:

```cmd
set RESTIC_REPOSITORY=\\192.168.0.40\e\Backups\restic-repo
set RESTIC_PASSWORD=CHANGE_ME_PASSWORD
set RESTORE_TARGET=D:\restore
```

`RESTIC_PASSWORD` — постоянный пароль репозитория. Без него восстановить бэкап нельзя.

## 2. Проверить restic.exe

```powershell
.\restic.exe version
```

`restic.exe` должен лежать в этой же папке `Backup`.

## 3. Создать репозиторий

Один раз:

```powershell
.\init.cmd
```

Если репозиторий уже создан, повторно не запускать.

## 4. Запустить бэкап

```powershell
.\backup.cmd
```

Если бэкап прервался, просто запусти `backup.cmd` ещё раз.

Если после прерывания restic пишет про lock:

```powershell
.\unlock.cmd
```

потом снова:

```powershell
.\backup.cmd
```

## 5. Посмотреть точки восстановления

```powershell
.\snapshots.cmd
```

## 6. Проверить репозиторий

```powershell
.\check.cmd
```

## 7. Восстановить последний бэкап целиком

```powershell
.\restore-latest.cmd
```

Папка восстановления задаётся в `restic.env.cmd`:

```cmd
set RESTORE_TARGET=D:\restore
```

## 8. Восстановить одну папку

```powershell
.\restore-folder.cmd "D:\current\Документы"
```

## 9. Восстановить конкретный snapshot

Сначала посмотреть ID:

```powershell
.\snapshots.cmd
```

Потом:

```powershell
.\restore-snapshot.cmd fe9a9400
```

## 10. Источники

Файл:

```text
sources.txt
```

## 11. Исключения

Файл:

```text
excludes.txt
```

## 12. Планировщик Windows

Программа/скрипт:

```text
D:\current\coding\Backup\backup.cmd
```

Рабочая папка:

```text
D:\current\coding\Backup
```
