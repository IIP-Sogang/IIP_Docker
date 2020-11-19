# Install Matlab in Docker 

FROM ahstarwab/pytorch18_cuda11

#### X11 forwarding  ####
RUN apt-get update
RUN apt-get install -qqy x11-apps
#ENV DISPLAY :0

### Dependency
RUN apt-get install -qqy lsb-release
RUN apt-get install -qqy libxt-dev
RUN apt-get install -qqy libxtst-dev
RUN apt-get install -qqy libxrender-dev
RUN apt-get install -qqy libxext-dev


