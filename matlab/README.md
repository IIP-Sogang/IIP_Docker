# Docker에 Matlab을 설치하는DockerFile


2020-11-18 ubuntu20.04  

build.sh 를 실행하면 된다. 2번 실행하면 된다.   

맨 마지막에 언급하였으나 Matlab 설치 파일의 install 실행 시 
```
terminate called after throwing an instance of 'std::runtime_error'
  what():  Unable to launch the MATLABWindow application
Aborted (core dumped)
```

발생시 ```bin/glnxa64/install_unix_legacy```    를 이용해 설치한다. 
  
아래와 같은 문제가 발생하였으나 2번 실행해서 해결되었다.   
의존성이 있는 명령어의 순서 문제 같다. 하지만 설치에 성공하였기 때문에   
자세한 분석 및 해결을 하지 않았다.   

```
Step 5/9 : RUN apt-get install -qqy lsb-release
 ---> Running in c8126efb601c
E: Failed to fetch https://mirrors.tuna.tsinghua.edu.cn/ubuntu/pool/main/d/distro-info-data/distro-info-data_0.37ubuntu0.9_all.deb  Could not connect to mirrors.tuna.tsinghua.edu.cn:443 (101.6.8.193), connection timed out
E: Failed to fetch https://mirrors.tuna.tsinghua.edu.cn/ubuntu/pool/main/l/lsb/lsb-release_9.20170808ubuntu1_all.deb  Unable to connect to mirrors.tuna.tsinghua.edu.cn:https:
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
The command '/bin/sh -c apt-get install -qqy lsb-release' returned a non-zero code: 100
```

lsb-release 가 없다고 한다. 

근데 한번 더 하니까 설치가 된다.

```
xauth:  file /tmp/.docker.xauth does not exist
Unable to find image 'pytorch18_cuda11_matlab:v1' locally
docker: Error response from daemon: pull access denied for pytorch18_cuda11_matlab, repository does not exist or may require 'docker login': denied: requested access to the resource is denied.
```
이것도 뜨는데 build 한번더하면 안 생긴다. 순서 문제 같음.


+ 아래과 같은 에러가 발생한다. 

```
(base) root@19553db4e3c4:/home/setup/matlab# ./install 
terminate called after throwing an instance of 'std::runtime_error'
  what():  Unable to launch the MATLABWindow application
Aborted (core dumped)
```

https://kr.mathworks.com/matlabcentral/answers/540707-why-does-matlab-fail-to-install-with-a-std-runtime_error-what-unable-to-launch-the-matlabwind

를 따라  
  
```bin/glnxa64/install_unix_legacy```   
를 실행해서 GUI가 정상적으로 동작하였다. 
