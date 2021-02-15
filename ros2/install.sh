#!/bin/bash

sudo apt-get install docker-ce nvidia-docker2 docker-compose

mkdir -p workspace

docker-compose build
docker-compose run --entrypoint "/bin/bash -c 'cd /workspace && mkdir -p src && colcon build'" ros2
