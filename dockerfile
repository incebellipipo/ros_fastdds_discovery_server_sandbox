ARG ROS_DISTRO=jazzy
FROM docker.io/library/ros:${ROS_DISTRO}-ros-core

ENV ROS_DISTRO=${ROS_DISTRO}

RUN apt-get update && apt-get install -y fastdds-tools

ENTRYPOINT ["/bin/bash", "-c", "set -e; source /opt/ros/${ROS_DISTRO}/setup.bash; exec \"$@\"", "--"]

