# iip:v7 이미지를 기반으로 생성합니다.
FROM iip:v8

#### X11 forwarding 용 구문 ####
#  RUN apt-get update
#  RUN apt-get install -qqy x11-apps
#  ENV DISPLAY :0


### NIVIDA
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

# 현재 폴더의 mnt 폴더를 docker container의 /mnt 폴더에 마운트합니다.
# 마운트는 파일을 공유하지 않습니다.
# ./mnt 의 내용을 /mnt에 올리는 행위입니다.
# host 와 container 간 파일 공유는 run.sh 에서 이루어집니다.
ADD ./mnt /mnt
