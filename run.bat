@echo off
set operation=%1
call env.bat
IF "%operation%" == "start" (
    if not exist %PROJECT%\ (
        mkdir %PROJECT%
    )
    if not exist home\ (
        mkdir home
    )
    copy .profile home\.profile
    robocopy .config home\.config /e
    robocopy .init home\.init /e
    set COMPOSE_PROJECT_NAME=${PROJECT} && docker-compose up --remove-orphans --force-recreate
) ELSE (
	IF "%operation%" == "stop" (
	    docker-compose down
	) ELSE (
	    echo "Must pass one of the args start|stop"
	)
)

