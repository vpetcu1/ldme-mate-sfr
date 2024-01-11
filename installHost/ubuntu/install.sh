#!/bin/bash
export INSTALL_HOST_HOME=$PWD
export PROJECT=$INSTALL_HOST_HOME/ldme-mate-sfr
export INIT_HOME=$PROJECT/.init
export PROJECT_HOME_FOLDER=$PROJECT/home
export PLATFORM_HOME=$PROJECT/sfr
export PROJECTS_HOME=$PLATFORM_HOME/projects
export INSTALL_HOME=$PLATFORM_HOME/install
export BACKUP_HOME=$PLATFORM_HOME/backup

function checkBin() {
  local _binary="$1" _full_path

  info "Checking binary '$_binary' ... "

  # Checks if the binary is available.
  _full_path=$( command -v "$_binary" )
  commandStatus=$?
  if [ $commandStatus -ne 0 ]; then
    errorMessage "Unable to find binary '$_binary'." $BSC_ERROR_CHECK_BIN
  else
    # Checks if the binary has "execute" permission.
    [ -x "$_full_path" ] && return 0

    # It is not the case, if NOT in 'BSC_MODE_CHECK_CONFIG' mode, it is a fatal error.
    errorMessage "Binary '$_binary' found but it does not have *execute* permission." $BSC_ERROR_CHECK_BIN
  fi

  # Otherwise, simple returns an error code.
  return 127
}

if ! checkBin git
then
  echo "Installing git..."
  sudo apt-get update && sudo apt-get install git -y
fi
git clone https://github.com/vpetcu1/ldme-mate-sfr.git4
cd $PROJECT/installHost/ubuntu/
bash installHost.sh
