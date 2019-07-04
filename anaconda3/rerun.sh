#! /bin/sh

docker start -a $1 && docker exec -it $1 /bin/bash

