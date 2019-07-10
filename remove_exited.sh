#! /bin/sh

# 종료된 컨테이너를 제거합니다. 

docker rm -v $(docker ps -a -q -f status=exited)
