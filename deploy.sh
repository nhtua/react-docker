#!/usr/bin/env bash

docker-compose stop
docker-compose rm -f
docker-compose pull
docker-compose up -d
