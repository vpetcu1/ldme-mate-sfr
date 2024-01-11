echo "Init unfold called with params: $@"
operation=$1
mkdir -p $INSTALL_HOME
folder="$INSTALL_HOME"
if [ "$operation" = "desktop" ]; then
    folder=$PROJECT_HOME_FOLDER
fi
mkdir -p $folder 
cd $folder
sudo chown -R $USER:$USER *
tar --overwrite -xzf $BACKUP_HOME/$operation.tar.gz
echo "Finished unfold $operation"
