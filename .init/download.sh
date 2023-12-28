#!/bin/bash
file="$1"
echo "Init download called with params: $@"
rclone copy gdrive:docker-station/$PROJECT/$file.tar.gz $BACKUP_HOME/
echo "Finished download $file"
cd $INIT_HOME
sh unfold.sh $file &
