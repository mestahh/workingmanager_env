#!/bin/bash

# install docker
sudo yum update -y
sudo yum install -y docker
sudo usermod -a -G docker ec2-user
id ec2-user
newgrp docker

# isntall docker-compose
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose

# start docker-service service
sudo systemctl enable docker.service
mkdir /home/ec2-user
sudo chown 1001:1001 /home/ec2-user/tomcat-data/