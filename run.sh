#! /bin/sh

### X11 forwarding 용 구문              ###
### Docker 에서 GUI를 쓸수 있게  합니다 ###
### MATLAB 설치시 사용함                ###
# XSOCK=/tmp/.X11-unix
# XAUTH=/tmp/.docker.xauth
# xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
# docker run -ti -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH iip:v4


if [ $# -eq 0 ];then
  echo 'usage : ./run.sh <name of container>'
else

# 현재 폴더에서 Dockerfile 로 iip:v9 라는 이미지를 생성합니다. 
# docker build . -t iip:v9

# iip:v6 이미지로 working 이라는 이름을 가진 컨테이너를 만듭니다.
# 현재 폴더의 data 폴더를 docker conatiner의 /home/data 폴더와 공유합니다.
# host와 docker container 양쪽에서 같은 파일을 조작할 수 있습니다.
# * note * 공유 폴더의 데이터는 Host 소유이기 때문에 컨테이너에 저장되지 않습니다.
# 컨테이너에 저장하려면 Docker 컨테이너 내부의 폴더에 복사하십시오. 


# 터미널로 /bin/sh를 실행합니다.
# docker run --name  $1 -v ${PWD}/iip/:/home/iip/ -it iip:v9 /bin/sh

docker run --runtime=nvidia --name  $1 -v ${PWD}/iip/:/home/iip/ -it iip:v10 /bin/sh

fi
