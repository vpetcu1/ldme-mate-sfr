mkdir -p $PROJECTS_HOME
export PROJECT_HOME=$PROJECTS_HOME/eDmcDispatcher
echo ###############################
echo # Clone the project
echo ###############################
cd $PROJECTS_HOME
git clone http://gitlab.gnp.les800/Dmc/eDmcDispatcher.git
echo ###############################
echo # Install bower
echo ###############################
cd $PROJECT_HOME/src/main/webapp
npm config set strict-ssl false
npm i -g bower
echo ###############################
echo # Install npm packages
echo ###############################
bower install
echo ###############################
echo # Install grunt
echo ###############################
npm i -g grunt
echo ###############################
echo # Maven clean package
echo ###############################
cd $PROJECT_HOME
mvn clean package -f "$PROJECT_HOME/pom.xml" -s "$M2_REPO_HOME/settings.xml"
cd $PROJECTS_HOME
