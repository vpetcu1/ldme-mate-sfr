echo "Init fold called with params: $@"
operation=$1
mkdir -p $BACKUP_HOME
folder="$INSTALL_HOME"
echo $operation
if [ "$operation" = "desktop" ]; then
    folder=$HOME
    cd $folder
    echo $PWD
    tar  -cvzf $BACKUP_HOME/$operation.tar.gz -X $INIT_HOME/exclusions.txt .
else
    cd $folder
    tar -czf $BACKUP_HOME/$operation.tar.gz $operation/
fi
echo "Finished fold $operation"
cd $INIT_HOME
sh upload.sh $operation.tar.gz &
