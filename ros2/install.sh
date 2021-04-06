#!/bin/bash

sudo apt-get install docker-ce nvidia-docker2 python3-pip zenity
sudo python3 -m pip install docker-compose

ws_loc=$(zenity --file-selection --directory --title="Please select a folder for your workspace")
ln -s $ws_loc workspace

docker-compose build
docker-compose run --entrypoint "/bin/bash -c 'cd /workspace && mkdir -p src && colcon build'" ros2
