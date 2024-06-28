operation=$1
source ./.env
case $operation in 
	start)
        sudo chown -R $USER:$USER .
        if [ ! -d ${PROJECT} ]; then
            mkdir -p ${PROJECT}
        fi
        if [ ! -d home ]; then
            mkdir -p home
        fi
        #cp .profile home/.profile
        #cp .bashrc home/.bashrc
        cp -R .config/ home/
        #cp -R .init/ home/
        #cp -R .installProjects/ home/
        sudo chmod 666 /var/run/docker.sock
        COMPOSE_PROJECT_NAME=${PROJECT} && docker-compose up --remove-orphans --force-recreate &
		;;
	stop)
		COMPOSE_PROJECT_NAME=${PROJECT} && docker-compose down --rmi local
		;;
	pull)
        docker pull vpetcu1/ldme-mate-sfr:${TAG}
        ;;
	*)
		echo "Must pass one of the args start|stop|pull"
		;;
esac
