#!/bin/bash
if [ -e $HOME/.logon_script_done ]
then
 echo "No actions to do"
else
 mate-terminal --display :1001.0 -e $INIT_HOME/install.sh desktop
 touch $HOME/.logon_script_done
fi
echo "Press any key to continue"

