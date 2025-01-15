#!/bin/sh
#
# for Dockerfile
#
contname=rfriends3
imgname=rfriends3

# ホスト側の共有ディレクトリ
hostshare=$HOME/share

# コンテナ側の共有ディレクトリ
user=user
contshare=/tmp/share

# ポートフォワーディング
# no にすると同一LANからアクセス不可だが複数のコンテナが実行可能
portfw=yes

if [ ! -d $hostshare ]; then
  mkdir -p $hostshare
fi
# ポート番号は変更不可
port=8000

#　コンテナ削除
docker stop $contname
docker rm   $contname

#　コンテナ実行
if [ $portfw = "yes" ]; then
  echo "port forwarding = yes"
  pfw='-p 8000:8000'
else
  echo "port forwarding = no"
  pfw=
fi

docker run $pfw \
 -it \
 --name $contname \
 --mount type=bind,src=$hostshare,target=$contshare \
 $imgname
#
