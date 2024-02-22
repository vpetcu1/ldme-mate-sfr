mkdir -p $PROJECTS_HOME
export PROJECT_HOME=$PROJECTS_HOME/MugWS
echo ###############################
echo # Clone the project
echo ###############################
cd $PROJECTS_HOME
git clone http://gitlab.gnp.les800/Dmc/MugWS.git
echo ###############################
echo # Install dependencies
echo ###############################
#nvm
export NVM_DIR="$INSTALL_HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use 18
cd $PROJECT_HOME
set -eux; \
    npm set registry http://nexus.dev.produit.gnp.les800/nexus/repository/npm-internal/; \
    npm install
cd $PROJECTS_HOME
