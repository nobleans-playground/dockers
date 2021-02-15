ARG ROS_DISTRO=foxy

FROM osrf/ros:$ROS_DISTRO-desktop

COPY apt_pkglist.txt /
COPY pip_pkglist.txt /

RUN apt-get update -qq && apt-get install -qqy gettext-base \
    && envsubst < apt_pkglist.txt | sort --unique | xargs --no-run-if-empty apt-get install -qqy \
    && rm -rf /var/lib/apt/lists/*

RUN envsubst < pip_pkglist.txt | sort --unique | xargs --no-run-if-empty pip3 install

# include ROS2 environment in bashrc
COPY bashrc /
RUN cat bashrc >> /root/.bashrc