# Remove unused data
docker system prune --all --volumes

# Remove all services
docker service rm $(docker service ls -q)

# Remove all containers
docker rm -f $(docker ps -aq)

# Remove all images
docker rmi -f $(docker images -aq)

# Remove all volumes
docker volume rm $(docker volume ls -q)

# stop docker service
systemctl stop docker

# Uninstall everything 
for pkg in docker.io docker-doc docker-compose docker-compose-plugin podman-docker containerd runc docker-ce-cli docker-buildx-plugin; do sudo apt-get remove $pkg -y; done

# Uninstalls the Docker Community Edition (docker-ce) package from your Debian system
apt-get purge docker-ce -y

# Removes any remaining Docker packages and their dependencies that were not automatically removed by the previous command
apt-get autoremove --purge docker-ce -y

# Uninstalls the Docker package from your Debian system
apt-get purge docker -y

# Removes any remaining Docker packages and their dependencies that were not automatically removed by the previous command
apt-get remove --purge docker -y

# remove docker group
groupdel docker

# Remove the Docker configuration files
rm -rf /etc/docker

# Remove the Docker Daemon's storage location
rm -rf /var/lib/docker

