# IIP_Docker

### [Docker Document](https://docs.docker.com)
### [Docker Hub](https://hub.docker.com)
### [Docker Cheat Sheet](https://github.com/wsargent/docker-cheat-sheet)


-- INDEX --<a name = "index"></a>

+ [설치](#install)
+ [사용](#use)
+ [수정](#modify)
+ [배포](#deploy)

### Component

+ anaconda
    + 4.3.0
    + [설치 파일 아카이브](https://repo.continuum.io/archive/)
+ matlab
    + r2019a
    + [matlab CLI install](https://gist.github.com/kahlos/97c9371f7a5476678ef11c836c97a14f)
    
일단 우분투 이미지 위에서 돌리자. 

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

+ 이미지 파일에서 가져오기
이미지를 저장한 tar 파일이 있다면

```
docker load -i <파일명> 
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
    + container 는 프로세스 입니다. 명령이 끝나면 종료됩니다.

+ 실행중인 도커 확인

```
$ docker ps

ONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS                  PORTS               NAMES
32b16a415be8        continuumio/anaconda3   "/usr/bin/tini -- /b…"   2 seconds ago       Up Less than a second                       youthful_pascal

```

+ 옵션들

### 이름
컨테이너에 지정된 이름을 부여합니다. 명시되지 않으면 임의의 인물명을 사용합니다. 

```
docker run --name <원하는 이름> 
ex) docker run -it --name my_contatiner_name iip:v4
```

### 볼륨

+ 호스트와 디렉토리를 공유합니다
+ 컨터이너의 출력물을 호스트에서 사용하거나 호스트의 파일을 도커에서 사용할 수 있습니다 .

```
docker run -v <host 디렉토리>:<contatiner 디렉토리> 
ex) docker run -it $PWD/data:/home/iip/data/ iip:v4
    docker run -it /home/git/IIP_Docker/data:/home/iip/data/ iip:v4
```

* note
    + ```.``` 을 이용한 상대경로를 사용할 수 없습니다. ```$pwd```를 사용하십시오.
 

+ [Docker Run Reference](https://docs.docker.com/engine/reference/run/)

## [수정](#index)<a name = "modify"></a>

컨테이너에 접속 해서
```
apt-get update
apt-get install libasound2-dev
exit
```

## [배포](#index)<a name = "deploy"></a>

+ contatiner -> image

```
docker commit <컨테이너> <이미지명:태그 ex) iip:v2 >
```

+ image -> tar file
```
docker save -o <파일명 ex) iip_v4.tar> <이미지>
```

+ docker hub 에 업로드
```
docker login
..
..

docker tag iip_demo_env koobh/iip_demo_env
docker push koobh/iip_demo_env
```
