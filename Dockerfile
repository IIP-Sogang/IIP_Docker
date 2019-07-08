FROM iip:v6

#RUN apt-get update
#RUN apt-get install -qqy x11-apps
#ENV DISPLAY :0

ADD ./mnt /mnt

CMD /bin/bash
