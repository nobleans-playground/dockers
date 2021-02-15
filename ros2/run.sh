#!/bin/bash

if [ -z `docker ps -q --no-trunc | grep "$(docker-compose ps -q ros2)"` ]; then
    echo "Docker container not running yet, starting..."
    docker-compose up --build -d
else
    echo "Docker container already running, attaching to existing container"
fi

docker-compose exec ros2 /bin/bash