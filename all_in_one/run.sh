#! /bin/sh

### BUILD ###
docker build . -t iip/demo:v3

### RUN : create & start & exec ###
docker run --name tmp -it iip/demo:v3 /bin/bash


# sudo docker run --rm -it -v /run/user/1000:/run/user/1000 -v /dev:/dev -v /tmp/.X11-unix:/tmp/.X11-unix:ro --privileged --ipc=host --shm-size=1024m --net=host -e DISPLAY=$DISPLAY -e XDG_RUNTIME_DIR=/run/user/1000 iip/demo:v2 /bin/bash
# sudo docker run --rm -it -v /run/user/1000:/run/user/1000 -v /dev:/dev -v /tmp/.X11-unix:/tmp/.X11-unix:ro --privileged --ipc=host --shm-size=1024m --net=host -e DISPLAY=$DISPLAY -e XDG_RUNTIME_DIR=/run/user/1000 iip/demo:v2 /mnt/matlab_R2019a_glnxa64/install


## CLEAN ###
docker rmi $(docker images -f "dangling=true" -q)
