#!/bin/bash

curl https://get.docker.com | sh
sudo systemctl --now enable docker

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update
sudo apt-get install -y nvidia-docker2

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

sudo systemctl restart docker

sudo apt-get install python3-pip zenity
sudo python3 -m pip install docker-compose

ws_loc=$(zenity --file-selection --directory --title="Please select a folder for your workspace")
ln -s $ws_loc workspace

docker-compose build
docker-compose run --entrypoint "/bin/bash -c 'cd /workspace && mkdir -p src && colcon build'" ros2
