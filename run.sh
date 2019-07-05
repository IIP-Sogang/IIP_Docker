#! /bin/sh
#docker build . -t alt:v1


### For matlab GUI installation  ###
# XSOCK=/tmp/.X11-unix
# XAUTH=/tmp/.docker.xauth
# xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
# docker run -ti -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH iip:v4


# 그냥 . 찍는 거는 인식 안됨 $PWD 를 쓰거나
# 절대경로 입력
 docker run -it --name iip -v $PWD/data:/home/iip/data/ iip:v4

 ./all_in_one/remove_exited.sh
