#!/bin/sh
#
# for Dockerfile
#
contname=rfriends3
imgname=rfriends3

# ホスト側の共有ディレクトリ
hostuser=`whoami`
hostshare1=/home/$hostuser/share/usr2
hostshare2=/home/$hostuser/share/rfriends3/config

# コンテナ側の共有ディレクトリ
contuser=user
contshare1=/tmp/share/usr2
contshare2=/home/$contuser/rfriends3/config

if [ ! -d $hostshare1 ]; then
  mkdir -p $hostshare1
fi
if [ ! -d $hostshare2 ]; then
  mkdir -p $hostshare2
fi

# ポートフォワーディング
# no にすると同一LANからアクセス不可だが複数のコンテナが実行可能
portfw=yes

# ポート番号は変更不可
port=8000

#　コンテナ削除
docker stop $contname
docker rm   $contname

#　コンテナ実行
if [ $portfw = "yes" ]; then
  echo "port forwarding = yes"
  host=`hostname -I`
  echo "host IPaddress : $host"
  pfw='-p 8000:8000'
else
  echo "port forwarding = no"
  pfw=
fi

echo
echo "[ホスト共有]"
echo "ユーザ : $hostuser"
echo "共有１ : $hostshare1"
echo "共有２ : $hostshare2"
echo 
echo "[コンテナ共有]"
echo "ユーザ : $contuser"
echo "共有１ : $contshare1"
echo "共有２ : $contshare2"
echo 

docker run $pfw \
 -it \
 --name $contname \
 --mount type=bind,src=$hostshare1,target=$contshare1 \
 --mount type=bind,src=$hostshare2,target=$contshare2 \
 $imgname
#
