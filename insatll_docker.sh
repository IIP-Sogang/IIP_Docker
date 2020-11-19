#! /bin/bash

sudo apt-get install -qqy docker docker.io
sudo groupadd docker
sudo usermod -aG docker $USER
