FROM docker.io/library/ros:jazzy

RUN apt-get update && apt-get install -y fastdds-tools

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]