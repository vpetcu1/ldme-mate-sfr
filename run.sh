operation=$1
case $operation in 
	start)
        if [ ! -d ${PROJECT} ]; then
            mkdir -p ${PROJECT}
        fi
        if [ ! -d home ]; then
            mkdir -p home
        fi
        cp .profile home/.profile
        cp -R .config/ home/
        cp -R .init/ home/
        cp -R .installProjects/ home/
        COMPOSE_PROJECT_NAME=${PROJECT} docker-compose up --remove-orphans --force-recreate &
		;;
	stop)
		docker-compose down
		;;
	*)
		echo "Must pass one of the args start|stop"
		;;
esac

