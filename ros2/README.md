# ROS2 development docker

## Installation
A workspace will be created in the same folder as the install script. It is therefore better not to clone this repo, but download a copy of this folder using subversion (`sudo apt-get install subversion`):
```
svn checkout https://github.com/nobleans-playground/dockers/trunk/ros2
cd ros2
rm -rf .svn
./install.sh
```
To use Visual Studio Code from outside the docker container, you have to install the "Remote - containers" extension. Launch VS Code Quick Open (Ctrl+P), paste the following command, and press enter.
```
ext install ms-vscode-remote.remote-containers
```

## Usage
Run `./run.sh` inside the ros2 folder created during installation. This will spawn a shell inside the docker container.
To connect Visual Studio Code to a running container click the green rectangle with "><" in the left bottom corner of your VS Code window and press "Remote-Containers: Attach to Running Container". Then select the docker container you would like to attach to. To open your workscace, go to "File" -> "Open Folder..." and select `/workspace/src`.