#!/bin/bash
export BSC_MODE_CHECK_CONFIG=1
source ./utils.sh
#install git if not exists 
if ! checkBin git
then
  echo "Installing git..."
  sudo apt-get update && sudo apt-get install git -y
fi
#install docker if not exists 
if ! checkBin docker-compose
then
  echo "Installing docker..."
  sudo apt-get update &&
  sudo apt-get install ca-certificates curl gnupg -y &&
  sudo install -m 0755 -d /etc/apt/keyrings &&
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg &&
  sudo chmod a+r /etc/apt/keyrings/docker.gpg &&
  echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update &&
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose docker-compose-plugin &&
  sudo groupadd docker && 
  sudo usermod -aG docker $USER && 
  newgrp docker && 
  sudo docker run hello-world
  sudo gpasswd -a $USER docker
  sudo service docker restart
fi
#install nomachine if not exists
if ! checkBin /usr/NX/bin/nxserver
then
  echo "Installing nomachine..."
  if [ ! -f nomachine.deb ]; then
      curl https://download.nomachine.com/download/8.10/Linux/nomachine_8.10.1_1_amd64.deb -o nomachine.deb 
  fi
  sudo dpkg -i nomachine.deb
fi
#rclone
if ! checkBin rclone
then
  echo "Installing rclone..."
  if [ ! -f rclone.deb ]; then
      curl -fSL "https://downloads.rclone.org/v1.65.0/rclone-v1.65.0-linux-amd64.deb" -o rclone.deb 
  fi
  sudo dpkg -i rclone.deb
  cp -R $PROJECT/.config $HOME/
fi
bash $INIT_HOME/install.sh
if ! checkBin forticlient
then
  echo "Installing forticlient..."
  if [ ! -f forticlient.deb ]; then
      curl https://filestore.fortinet.com/forticlient/forticlient_vpn_7.2.2.0753_amd64.deb -o forticlient.deb 
  fi
  sudo dpkg -i forticlient.deb
fi
if [ ! -f answer.txt ]; then
  > answer.txt
  echo "https://vpnssl2.infra.sfr-sh.fr/;https://vpnssl.infra.sfr-sh.fr/" >> answer.txt
  echo 1 >> answer.txt
  echo >> answer.txt
fi
forticlient vpn edit SFR < answer.txt
if [ ! -f hosts.bak ]; then
  echo "Apendign to /etc/hosts file..."
  sudo ./hosts.sh import hosts.txt --append
fi
cd $PROJECT_LOCATION
bash ./run.sh start