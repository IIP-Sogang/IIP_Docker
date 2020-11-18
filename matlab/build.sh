#! /bin/bash
docker build . -t pytorch18_cuda11_matlab:v1
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
docker run -ti -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -v /home/kiosk/setup/matlab2020b:/home/setup/matlab/ -e XAUTHORITY=$XAUTH pytorch18_cuda11_matlab:v1
