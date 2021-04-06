ARG ROS_DISTRO=foxy

FROM osrf/ros:$ROS_DISTRO-desktop

# copy package lists
COPY apt_pkglist.txt /
COPY pip_pkglist.txt /

# install apt-get packages
RUN apt-get update -qq && apt-get install -qqy gettext-base \
    && envsubst < apt_pkglist.txt | sort --unique | xargs --no-run-if-empty apt-get install -qqy \
    && rm -rf /var/lib/apt/lists/*

# install webots
# RUN wget -qO- https://cyberbotics.com/Cyberbotics.asc | sudo apt-key add -
# RUN apt-add-repository 'deb https://cyberbotics.com/debian/ binary-amd64/'
# RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -qqy webots && rm -rf /var/lib/apt/lists/*

COPY --from=cyberbotics/webots /usr/local/webots/lib/controller /usr/local/webots/lib/controller

# install pip packages
RUN envsubst < pip_pkglist.txt | sort --unique | xargs --no-run-if-empty pip3 install

# include ROS2 environment in bashrc
COPY bashrc /
RUN cat bashrc >> /root/.bashrc