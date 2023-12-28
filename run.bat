operation=%1
IF "%operation%"=="start" (
    call env.bat  
    if not exist %PROJECT%\ (
        mkdir %PROJECT%
    )
    if not exist home\ (
        mkdir home
    )
    copy .profile home/.profile
    copy -R .config/ home/
    copy -R .init/ home/
    set COMPOSE_PROJECT_NAME=${PROJECT} && docker-compose up --remove-orphans --force-recreate &
) ELSE IF "%operation%"=="stop" (
	docker-compose down
) ELSE (
    echo "Must pass one of the args start|stop"
)

