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
#
if [ ! -d $hostdir ]; then
  mkdir $hostdir
fi
#　コンテナ削除
docker stop $contname
docker rm   $contname
#　コンテナ作成
docker create --name $contname --mount type=bind,src=$hostdir,target=$contdir $imgname
#　コンテナスタート
docker start $contname
#　アタッチ
docker attach $contname
#
