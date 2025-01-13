#!/bin/sh
#
# for Dockerfile2
#
#　ホスト： $HOME/share
#　コンテナ： /tmp/share
#
#user=`whoami`
#HOME=/home/$user
hostdir=$HOME/share
contdir=/tmp/share
#
if [ ! -d $hostdir ]; then
  mkdir $hostdir
fi
#　コンテナ作成
docker create --name ex-rfriends3-2 --mount type=bind,src=$hostdir,target=$contdir rfriends3-2
#　コンテナスタート
docker start ex-rfriends3-2
#　アタッチ
docker attach ex-rfriends3-2
#
