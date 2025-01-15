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
# ポート番号は変更不可
port=8000

#　コンテナ削除
docker stop $contname
docker rm   $contname
#　コンテナ作成
if [ $portfw = "yes" ]; then
  echo "port forwarding = yes"
  echo "ホストのIPアドレス:$port でアクセスしてください"
  docker create -p $port:$port -it --name $contname --mount type=bind,src=$hostdir,target=$contdir $imgname
else
  echo "port forwarding = no"
  echo "コンテナのIPアドレス:$port でアクセスしてください"
  docker create -it --name $contname --mount type=bind,src=$hostdir,target=$contdir $imgname
fi
#　コンテナスタート
docker run $contname
#
