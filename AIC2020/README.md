
sudo apt-get install nvidia-docker2
docker pull nivida/cuda:10.1-cudnn7-runtime-ubuntu16.04


download matlab runtime

# package

strings /usr/lib/<your architecture>/libstdc++.so.6 | grep GLIBCXX
check if there is GLIBCXX_3.4.22

if not follow below instructions

# GLIBCXX_3.4.22
apt-get install software-properties-common
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install gcc-4.9
apt-get upgrade libstdc++6



apt-get update
apt-get install python3-pip
# install python3.8

add-apt-repository ppa:deadsnakes/ppa
apt update
apt install python3.8
apt install python3-pip
ln -s <python3.8> <python>
ln -s <python3.8> <python3>


