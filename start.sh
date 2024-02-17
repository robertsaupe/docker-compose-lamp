#!/usr/bin/env bash
cd "$(dirname "$(readlink -f "$0" || realpath "$0")")"

if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

CURRENT_UID=$(id -u):$(id -g) docker compose up -d

#read -p "Press any key to resume ..."
