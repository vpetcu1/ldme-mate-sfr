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
    echo %PROJECT%
    set COMPOSE_PROJECT_NAME=%PROJECT%
    docker-compose up --remove-orphans --force-recreate
) ELSE IF "%operation%" == "stop" (
	    docker-compose down
) ELSE IF "%operation%" == "pull" (
	    docker pull vpetcu1/ldme-mate-base:%TAG%
) ELSE (
    echo "Must pass one of the args start|stop|pull"
)

