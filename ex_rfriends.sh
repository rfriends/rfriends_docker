#!/bin/sh
#
# for Dockerfile
#
#　ホスト： $HOME/share
#　コンテナ： /tmp/share
#
hostdir=$HOME/share
contdir=/tmp/share
contname=rfriends3
imgname=rfriends3
port=8000
#
if [ ! -d $hostdir ]; then
  mkdir $hostdir
fi
#　コンテナ削除
docker stop $contname
docker rm   $contname
#　コンテナ作成
docker create -p $port:$port -it --name $contname --mount type=bind,src=$hostdir,target=$contdir $imgname
#　コンテナスタート
docker run $contname
#
