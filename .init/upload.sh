#!/bin/bash
file="$1"
echo "Init upload called with params: $@"
rclone copy $BACKUP_HOME/$file gdrive:docker-station/$PROJECT/
echo "Finished uploading $file"