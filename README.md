# ROS2 Discovery Server Testing

A Docker-based environment for testing FastDDS Discovery Server capabilities across ROS2 networks.

## Description

This repository provides a containerized setup to test and verify ROS2 nodes' communication over a network using the FastDDS Discovery Server. It allows you to:

- Test reliable ROS2 communication over networks
- Verify Discovery Server functionality with practical examples
- Easily test against different ROS2 distributions

## Prerequisites

- Docker and Docker Compose

## Setup

Build and start the containers:
```bash
docker compose up --build
```

## How It Works

The setup consists of three Docker containers:

1. **Discovery Server** (`discovery`): Runs the FastDDS Discovery Server that enables nodes to find each other on the network
   - IP address: 172.20.0.2
   - Server ID: 0

2. **Publisher** (`chatter`): Publishes messages to the `/chatter` topic
   - IP address: 172.20.0.3
   - Configured to use the Discovery Server

3. **Subscriber** (`listener`): Subscribes to the `/chatter` topic
   - IP address: 172.20.0.4
   - Configured to use the Discovery Server

All nodes are configured to communicate via the Discovery Server rather than the default multicast discovery, demonstrating reliable communication in environments where multicast might be problematic.

## Testing Different ROS Versions

You can easily test against different ROS2 distributions by modifying the `ROS_DISTRO` argument in the `compose.yml` file:

```bash
docker compose build --build-arg ROS_DISTRO=humble
```
This will build the containers using the specified ROS2 distribution. Supported distributions include `foxy`, `galactic`, and `humble`.

## Troubleshooting

If nodes cannot discover each other:

1. Verify the Discovery Server is running: `docker logs discovery`
2. Check that the `ROS_DISCOVERY_SERVER` environment variable is correctly set in each service
3. Ensure network settings are properly configured in `compose.yml`
