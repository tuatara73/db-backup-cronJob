#!/bin/bash

now="$(date +'%F')"
filename="db_backup_$now".gz
backupfolder="/root/pg-dump/"
fullpathbackupfile="$backupfolder/$filename"
logfile="$backupfolder/"backup_log_"$(date +'%Y_%m')".txt
echo "pgdump started at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
pg_dump -U confdbuser confdb | gzip > "$fullpathbackupfile"
echo "pgdump finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
find "$backupfolder" -name db_backup_* -mtime +4 -exec rm {} \;
echo "old files deleted" >> "$logfile"
echo "operation finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
echo "*****************" >> "$logfile"
exit 0


