#!/bin/sh
#
# for Dockerfile
#
#　ホスト： $HOME/share
#　コンテナ： /tmp/share
#

contname=rfriends3
imgname=rfriends3

# ホスト側の共有ディレクトリ
hostdir=$HOME/share

# コンテナ側の共有ディレクトリ
user=user
contdir=/tmp/share

# ポートフォワーディング
# no にすると同一LANからアクセス不可だが複数のコンテナが実行可能
portfw=yes

if [ ! -d $hostdir ]; then
  mkdir $hostdir
fi
# ポート番号は変更不可
port=8000

#　コンテナ削除
docker stop $contname
docker rm   $contname

#　コンテナ作成
docker create -it --name $contname --mount type=bind,src=$hostdir,target=$contdir $imgname

#　コンテナスタート
if [ $portfw = "yes" ]; then
  echo "port forwarding = yes"
  edocker run $port=$port $contname
else
  echo "port forwarding = no"
  docker run $contname
fi
#
