export PROJECT=ldme-mate-sfr
export PROJECT_HOME_FOLDER=$HOME
export INIT_HOME=$PROJECT_HOME_FOLDER/.init
export PLATFORM_HOME=$PROJECT_HOME_FOLDER/sfr
export PROJECTS_HOME=$PLATFORM_HOME/projects
export INSTALL_HOME=$PLATFORM_HOME/install
export BACKUP_HOME=$PLATFORM_HOME/backup

#java
if [ -d "$INSTALL_HOME/java/openlogic-openjdk-8u392-b08-linux-x64/bin" ] ; then
  PATH="$PATH:$INSTALL_HOME/java/openlogic-openjdk-8u392-b08-linux-x64/bin"
fi
export JAVA_HOME=$INSTALL_HOME/java/openlogic-openjdk-8u392-b08-linux-x64

#maven
if [ -d "$INSTALL_HOME/maven/apache-maven-3.9.6/bin" ] ; then
  PATH="$PATH:$INSTALL_HOME/maven/apache-maven-3.9.6/bin"
fi
export MAVEN_HOME=$INSTALL_HOME/maven/apache-maven-3.9.6
export M2_HOME=$INSTALL_HOME/maven/apache-maven-3.9.6
export M2_REPO_HOME=$INSTALL_HOME/.m2
export M2_REPO=$INSTALL_HOME/.m2/repository

export MAVEN_OPTS="$MAVEN_OPTS -Dmaven.repo.local=/home/desktop/sfr/install/.m2/repository"
export MAVEN_OPTS="$MAVEN_OPTS -Dmaven.settings=/home/desktop/sfr/install/.m2/settings.xml"

#nvm
export NVM_DIR="$INSTALL_HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#intellij idea
if [ -d "$INSTALL_HOME/intellij/idea-IU-233.14475.28/bin" ] ; then
  PATH="$PATH:$INSTALL_HOME/intellij/idea-IU-233.14475.28/bin"
fi

#Postman
if [ -d "$INSTALL_HOME/Postman" ] ; then
  PATH="$PATH:$INSTALL_HOME/Postman"
fi

#Postman
if [ -d "$INSTALL_HOME/tomcat/apache-tomcat-7.0.109/bin" ] ; then
  PATH="$PATH:$INSTALL_HOME/tomcat/apache-tomcat-7.0.109/bin"
fi
export CATALINA_HOME=$INSTALL_HOME/tomcat/apache-tomcat-7.0.109

#VSCode
if [ -d "$INSTALL_HOME/vscode/VSCode-linux-x64" ] ; then
  PATH="$PATH:$INSTALL_HOME/vscode/VSCode-linux-x64"
fi