#docker run -it --runtime=nvidia --name test_1 -v /home/kiosk/setup/:/home/setup nvidia/cuda:10.1-cudnn7-runtime-ubuntu16.04 /bin/bash
docker run -it --runtime=nvidia --name test_2 -v /home/kiosk/setup/:/home/setup aic2020:V1 /bin/bash
