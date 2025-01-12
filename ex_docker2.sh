#!/bin/sh
#
# for Dockerfile2
#
mkdir $HOME/share
docker run -d -it --rm --name ex-rfriends3-2 --mount type=bind,src=$HOME/share,target=/tmp/share rfriends3-2 /bin/bash
