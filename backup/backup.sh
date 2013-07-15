#!/bin/sh
## backup theLife server data, intended as a CRON job
#0 1 * * * /var/www/theLifeWeb_backup/backup.sh

mysqldump --user=root --password=tL13tL13 --add-drop-table --skip-opt thelife >/var/www/theLifeWeb_backup/backup_db_`date "+%a"`.sql
cd /var/www/html/theLifeWeb2/shared
tar -cf /var/www/theLifeWeb_backup/backup_uploads_`date "+%a"`.tar uploads
tar -cf /var/www/theLifeWeb_backup/backup_static_`date "+%a"`.tar static
