# IIP_Docker

### [Docker Document](https://docs.docker.com)
### [Docker Hub](https://hub.docker.com)
### [Docker Cheat Sheet](https://github.com/wsargent/docker-cheat-sheet)


-- INDEX --<a name = "index"></a>

+ [설치](#install)
+ [사용](#use)
+ [수정](#modify)
+ [배포](#deploy)

### TODO
이미지 받기  
받은 이미지 컨테이너 돌리기  
빈 이미지 만들기  
컨테이너에 추가 설치하기   
추가 설치한 컨테이너를 이미지로 만들기  
배포    

volume 사용하기 

Dockerfile 사용하기  

matlab 라이센스 문제를 고려한 사용, matlab Runtime 이미지가 있는 걸 보니까 '사용' 자체만 하는 건 될 거 같다.  
이건 matlab의 작동 방식을 좀 알아봐야할듯. executable 을 빌드 할 수 있는 걸로 알고 있는데.  

## [설치](#index)<a name = "install"></a>

+ 도커 설치

```
sudo apt-get install docker
```

+ 이미지 받기

```
docker pull <소유자>/<이미지 이름>[:<버전 | default = latest>]
ex) 
docker pull continuumio/anaconda3
docker pull continuumio/anaconda3:latest
docker pull continuumio/anaconda3:5.0.0p0
```

+ 이미지 확인

```
$ docker images

EPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
continuumio/anaconda3   latest              cb34e4508fdc        5 weeks ago         3.72GB
koobh/iip_demo_env      latest              b42211c6a9f9        2 months ago        1.27GB

```

* [anaconda3 도커 허브](https://hub.docker.com/r/continuumio/anaconda3)


## [사용](#index)<a name = "use"></a>

```
$ docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]
ex)
docker run -i -t continuumio/anaconda3 /bin/bash
--> anaconda3의 이미지로 컨테이너를 생성해서 bash로 접속합니다. 
```
Foreground 옵션
+ -t              : Allocate a pseudo-tty, 터미널을 사용
+ -i              : Keep STDIN open even if not attached, 표준 입력을 넣음

<docker에 접속 한 뒤에>
```
$ ls
se) root@32b16a415be8:/# ls
bin   dev  home  lib64  mnt  proc  run   srv  tmp  var
boot  etc  lib   media  opt  root  sbin  sys  usr

```

+ Note
    + 별도의 옵션이 없다면 컨테이너 exit 시, 컨테이너는 소멸합니다.
    + 별도의 옵션이 업다면 컨테이너 exit 시, 컨테이너의 데이터는 보존되지 않습니다.

+ 실행중인 도커 확인

```
$ docker ps

ONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS                  PORTS               NAMES
32b16a415be8        continuumio/anaconda3   "/usr/bin/tini -- /b…"   2 seconds ago       Up Less than a second                       youthful_pascal

```

+ 옵션들

+ 볼륨
컨테이너에서의 작업기록을 남기기 위해서 볼륨을 설정해야합니다.

+ [Docker Run Reference](https://docs.docker.com/engine/reference/run/)

## [수정](#index)<a name = "modify"></a>

컨테이너에 접속 해서
```
apt-get update
apt-get install libasound2-dev
exit
```

## [배포](#index)<a name = "deploy"></a>


```
docker login
..
..
docker commit iip_demo_env iip_demo_env
docker tag iip_demo_env koobh/iip_demo_env
docker push koobh/iip_demo_env
```
