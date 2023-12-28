#!/bin/bash
function exists_in_list() {
    LIST=$1
    DELIMITER=$2
    VALUE=$3
    LIST_WHITESPACES=`echo $LIST | tr "$DELIMITER" " "`
    for x in $LIST_WHITESPACES; do
        if [ "$x" = "$VALUE" ]; then
            return 0
        fi
    done
    return 1
}

option="all"
if [ "$1" != "" ]; then
    option="$1"
fi

echo option=$option
. $INIT_HOME/.env
list=$option
if [ "${option}" = "all" ]; then
    list=$OPTIONS
elif ! exists_in_list "$OPTIONS" " " $option; then
    echo "$option is not in the .env file OPTIONS"
    echo "OPTIONS=all $OPTIONS"
fi
for val in $list; do
    cd $INIT_HOME
    sh download.sh $val &
done
read
