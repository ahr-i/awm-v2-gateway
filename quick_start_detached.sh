#!/bin/bash

# Variables
CONF_DIR="./nginx.conf"
NETWORK_NAME="host"
#NETWORK_SUBNET="101.0.0.0/24"
IMAGE_NAME="nginx"
CONTAINER_NAME="awm-v2-gateway"
#CONTAINER_IP="101.0.0.2"
PORT="80"

# Step 1: Docker Pull
docker pull nginx || { echo "Docker pull failed."; exit 1; }

# Step 2: Docker Create Network
#docker network create --subnet $NETWORK_SUBNET $NETWORK_NAME
#if [ $? -ne 0 ]; then
#  echo "Network creation failed. An existing network already exists."
#fi

# Step 3: Docker Container Start
docker run -it --rm --name $CONTAINER_NAME --network $NETWORK_NAME -p $PORT:80 -v $CONF_DIR:/etc/nginx/nginx.conf:ro $IMAGE_NAME
if [ $? -ne 0 ]; then
  echo "Container execution failed."
  exit 1
fi
