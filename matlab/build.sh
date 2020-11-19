#! /bin/bash
docker build . -t pytorch18_cuda11_matlab:v1
xhost +local:
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
docker run -ti -v $XSOCK:$XSOCK -v "$XAUTH:$XAUTH:rw" -v /home/kbh/matlab/R2020b:/home/setup/matlab/ -e XAUTHORITY=$XAUTH  --env "DISPLAY" pytorch18_cuda11_matlab:v1
