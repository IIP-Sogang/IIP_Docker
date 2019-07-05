### v1 build ###
# FROM ubuntu:16.04
# RUN apt-get update
# RUN apt-get --assume-yes install bzip2
# ADD ./mnt /mnt
# EXPOSE 7070

### v2 build ###
#FROM iip/demo:v2

# Replace 1000 with your user / group id
#RUN export uid=1000 gid=1000 && \
#    mkdir -p /home/developer && \
#    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#    echo "developer:x:${uid}:" >> /etc/group && \
#    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#    chmod 0440 /etc/sudoers.d/developer && \
#    chown ${uid}:${gid} -R /home/developer
#
#USER developer
#ENV HOME /home/developer
#


### v3 build ###
FROM iip/demo:v3
ADD ./mnt /mnt
