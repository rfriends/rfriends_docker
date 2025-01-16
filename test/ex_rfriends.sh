#!/bin/sh
#
# for Dockerfile
#
contname=rfriends3
imgname=rfriends3

# ホスト側の共有ディレクトリ
hostuser=`whoami`
hostshare1=/home/$hostuser/share/smbdir/usr2
hostshare2=/home/$hostuser/share/rfriends3/config

# コンテナ側の共有ディレクトリ
contuser=user
contshare1=/home/$contuser/smbdir/usr2
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
smbport=445

pfw='-p 8000:8000'
smbfw= '-p 445:445'


#　コンテナ削除
docker stop $contname
docker rm   $contname

#　コンテナ実行
if [ $portfw = "yes" ]; then
  echo "port forwarding = yes"
  host=`hostname -I`
  echo "host IPaddress : $host"
else
  echo "port forwarding = no"
  pfw=
fi

docker run $pfw $smbfw\
 -it \
 --name $contname \
 --mount type=bind,src=$hostshare1,target=$contshare1 \
 --mount type=bind,src=$hostshare2,target=$contshare2 \
 $imgname
#
