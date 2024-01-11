export PROJECT=ldme-mate-sfr
export PROJECT_HOME_FOLDER=$HOME
export INIT_HOME=$PROJECT_HOME_FOLDER/.init
export PLATFORM_HOME=$PROJECT_HOME_FOLDER/sfr
export PROJECTS_HOME=$PLATFORM_HOME/projects
export INSTALL_HOME=$PLATFORM_HOME/install
export BACKUP_HOME=$PLATFORM_HOME/backup

#nvm
export NVM_DIR="$INSTALL_HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
