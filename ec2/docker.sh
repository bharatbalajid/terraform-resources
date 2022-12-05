#! /bin/bash
sudo yum update -y
sudo yum upgrade -y
sudo yum docker -y
sudo systemctl start docker
sudo systemctl enable docker
