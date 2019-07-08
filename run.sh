#! /bin/sh
#XSOCK=/tmp/.X11-unix
#XAUTH=/tmp/.docker.xauth
#xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
#docker run -ti -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH iip:v4


docker build . -t iip:v6
docker run --name working -v ${PWD}/data/:/home/data/ -it iip:v6 /bin/sh

