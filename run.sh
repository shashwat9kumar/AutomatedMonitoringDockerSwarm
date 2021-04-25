#!/bin/bash

sudo su

cd AutomatedMonitoringDockerSwarm

IPADDR=$(dig +short myip.opendns.com @resolver1.opendns.com)

echo $IPADDR

sudo apt update
echo -e ""
echo -e ""
echo "SYSTEM UPDATED"

sudo apt install docker.io -y
echo -e ""
echo -e ""
echo "DOCKER INSTALLED"

sudo docker swarm init --advertise-addr $IPADDR
echo -e ""
echo -e ""
echo "DOCKER SWARM INITIALIZED"


sudo docker stack deploy -c docker-compose.yml monitoring_stack
echo -e ""
echo -e ""
echo "DOCKER STACK DEPLOYED"
