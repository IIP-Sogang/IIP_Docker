# IIP_Docker

### [Docker Document](https://docs.docker.com)
### [Docker Hub](https://hub.docker.com)
### [Docker Cheat Sheet](https://github.com/wsargent/docker-cheat-sheet)


## INDEX <a name = "index"></a>

+ [설치](#install)
+ [사용](#use)
+ [수정](#modify)
+ [배포](#deploy)
+ [예시](#example)


### Component

+ anaconda
    + 4.3.0
    + [설치 파일 아카이브](https://repo.continuum.io/archive/)
+ matlab
    + r2019a
    + [matlab CLI install](https://gist.github.com/kahlos/97c9371f7a5476678ef11c836c97a14f)
    + CLI 설치는 file installation key와 matlab DVD 가 필요합니다.
    + 계정으로 인증하려면 GUI를 사용해야하며 X11 forwarding을 사용해야합니다. 
+ cuda
```apt-get install -f cuda-9-0```

## Note
+ matlab 은 command line 으로만 사용가능 합니다.(인증단계까지는 GUI 가능)
+ matlab license 계정은 nine4409@sogang.ac.kr 입니다. 

## [설치](#index)<a name = "install"></a>

+ 도커 설치



    + 일반적 설치
 
```sudo apt-get install docker```
  
  

    + [최신버전 설치](https://docs.docker.com/engine/install/ubuntu/)
    
      
```  
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo apt-get update
```

+ user를 docker에 등록
1. docker group 확인
```
cat /etc/group | grep docker 
```

1-1. docker group 이 없다면 만든다. 
```
sudo groupadd docker
```

2. user를 docker group 에 추가한 뒤 docker 재시작. 
```
sudo usermod -aG docker $USER
sudo service docker restart
```

restart 해도 permission 요구할 경우 reboot  

## NOTE
docker service 재시작 해도 권한이 바로 적용되지 않는다. 재부팅 없이권한을 적용 하는 방법을 찾아보자


+ 이미지 받기 - 도커 허브에서

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

+ gpu 사용
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker  
```
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
   
   sudo apt-get update
   sudo apt-get install -y nvidia-docker2
   sudo systemctl restart docker

docker run --gpus all -i -t <콘테이너> /bin/bash
```
Foreground 옵션
+ -t              : Allocate a pseudo-tty, 터미널을 사용
+ -i              : Keep STDIN open even if not attached, 표준 입력을 넣음

<docker에 접속 한 뒤에>  
root 계정으로 접속한것을 볼 수 있습니다. 
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
$ docker ps -a

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
ex) docker run -it -v $PWD/data:/home/iip/data/ iip:v4
    docker run -it -v /home/git/IIP_Docker/data:/home/iip/data/ iip:v4
```

* note
    + ```.``` 을 이용한 상대경로를 사용할 수 없습니다. ```$PWD```를 사용하십시오.
 

+ [Docker Run Reference](https://docs.docker.com/engine/reference/run/)

## [수정](#index)<a name = "modify"></a>

컨테이너에 접속 해서
```
apt-get update
apt-get install libasound2-dev
exit
```
작프로세스 종료시 해당 상태가 ```exited``` 된 컨테이너로 저장됩니다. 


## [저장 및 배포](#index)<a name = "deploy"></a>

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

## [이어하기](#index)<a name = "start"></a>  
```
docker start <ID or name> <-i>
```

## [예시](#index)<a name = "example"></a>

```Dockerfile``` 과 ```run.sh``` 를 사용합니다. 

```Dockerfile
# iip:v7 이미지를 기반으로 생성합니다.
FROM iip:v7

# 현재 폴더의 mnt 폴더를 docker container의 /mnt 폴더에 마운트합니다.
# 마운트는 파일을 공유하지 않습니다.
# ./mnt 의 내용을 /mnt에 올리는 행위입니다.
# host 와 container 간 파일 공유는 run.sh 에서 이루어집니다.
ADD ./mnt /mnt
```

```bash
#! /bin/sh

# 현재 폴더에서 Dockerfile 로 iip:v7 라는 이미지를 생성합니다. 
docker build . -t iip:v7
# iip:v6 이미지로 working 이라는 이름을 가진 컨테이너를 만듭니다.
# 현재 폴더의 data 폴더를 docker conatiner의 /home/data 폴더와 공유합니다.
# host와 docker container 양쪽에서 같은 파일을 조작할 수 있습니다.
# 터미널로 /bin/sh를 실행합니다.
docker run --name working -v ${PWD}/data/:/home/data/ -it iip:v7 /bin/sh
```

1. ```run.sh``` 를 실행하면 ```mnt``` 폴더를 마운트하고 ```data```폴더를 공유하는 컨테이너가 생성되고,
해당 컨테이너의 터미널로 접속합니다. ```/bin/sh```

2. 작업을 수행합니다. 

3. ```exit```  합니다.

컨터이너가 종료됩니다. 변동사항을 안에 담고있습니다. 다만 data 폴더의 사항은 호스트와 공유하는 것이기에 담고 있지 않습니다.   

4. ```docker ps -a ```를 하면 ```exited```된 컨테이너가 있습니다.  

5. ```docker commit <extied 된 container 이름> <새로 만들 이미지 이름>```  

을 하면 해당 컨테이너를 이미지로 변환합니다.  

6. ```docker save -o <파일명.tar> <이미지 명>```  

을 하면 해당 이미지를 tar 파일로 추출합니다.    

7. ```docker load -i <파일명.tar>```   
를 하면 해당 이미지를 가져옵니다. 
