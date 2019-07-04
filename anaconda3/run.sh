#! /bin/sh

#docker run -i -t continuumio/anaconda3 /bin/bash

# following commands are equivalence.

# 1 - docker run :  creates and starts a container in one operation.
# docker run -it continuumio/anaconda3 /bin/bash


# 2 - docker create : creates a container but does not start 
#   - docker start  : starts a container so it is running.
# docker create continuumio/anaconda3
# docker start
