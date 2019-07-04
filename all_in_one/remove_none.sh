#! /bin/bash

docker images -a | grep none | (awk '{ $3}') | echo
