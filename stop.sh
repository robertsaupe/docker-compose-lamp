#!/usr/bin/env bash
cd "$(dirname "$(readlink -f "$0" || realpath "$0")")"

if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

act_user=$(id -u)

docker exec -d $COMPOSE_PROJECT_NAME-$DATABASE chown -R $act_user /var/lib/mysql
docker exec -d $COMPOSE_PROJECT_NAME-$DATABASE chown -R $act_user /var/log/mysql
docker exec -d $COMPOSE_PROJECT_NAME-$PHPVERSION chown -R $act_user /var/www/html
docker exec -d $COMPOSE_PROJECT_NAME-$PHPVERSION chown -R $act_user /var/log/apache2

CURRENT_UID=$(id -u):$(id -g) docker compose down

#read -p "Press any key to resume ..."
