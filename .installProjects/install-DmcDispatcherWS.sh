mkdir -p $PROJECTS_HOME
export PROJECT_HOME=$PROJECTS_HOME/DmcDispatcherWS
echo ###############################
echo # Clone the project
echo ###############################
cd $PROJECTS_HOME
git clone http://gitlab.gnp.les800/Dmc/DmcDispatcherWS.git
echo ###############################
echo # Maven clean package
echo ###############################
cd $PROJECT_HOME
mvn clean package -f "$PROJECT_HOME/pom.xml" -s "$M2_REPO_HOME/settings.xml" -DskipTests=true
cd $PROJECTS_HOME
