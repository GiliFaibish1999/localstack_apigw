#!/usr/bin/env bash -x

docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)
docker-compose up -d