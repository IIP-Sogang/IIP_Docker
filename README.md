# IIP_Docker

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

Dockerfile 사용하기  

matlab 라이센스 문제를 고려한 사용. - matlab Runtime 이미지가 있는 걸 보니까 '사용' 자체만 하는 건 될 거 같다,

## [설치](#index)<a name = "install"></a>

+ 이미지 받기
```
docker pull <소유자>/<이미지 이름>:<버전>
ex) docker pull rikorose/gcc-cmake:latest

```

## [사용](#index)<a name = "use"></a>

```
docker run --name="iip_demo_env" -it rikorose/gcc-cmake:latest /bin/bash
```


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
