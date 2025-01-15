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
portfw=no
#
if [ ! -d $hostdir ]; then
  mkdir $hostdir
fi
if [ -f $HOME/rfriends_port ]; then
  port=`cat $HOME/rfriends_port`
else
  port=8000
fi
#　コンテナ削除
docker stop $contname
docker rm   $contname
#　コンテナ作成
if [ $portfw = "yes" ]; then
  echo "port forwarding = yes"
  echo `hostname -i`:$port
  docker create -p $port:$port -it --name $contname --mount type=bind,src=$hostdir,target=$contdir $imgname
else
  echo "port forwarding = no"
  cat $HOME/rfriends_server.txt
  docker create -it --name $contname --mount type=bind,src=$hostdir,target=$contdir $imgname
fi
#　コンテナスタート
docker run $contname
#
