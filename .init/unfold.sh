echo "Init unfold called with params: $@"
operation=$1
mkdir -p $INSTALL_HOME
folder="$INSTALL_HOME"
if [ "$operation" = "desktop" ]; then
    folder=$HOME
fi
cd $folder
tar --overwrite -xzf $BACKUP_HOME/$operation.tar.gz &
echo "Finished unfold $operation"
