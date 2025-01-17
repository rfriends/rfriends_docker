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
httpfw=yes
smbfw=yes

# ポート番号は変更不可
httpport=8000
smbport=445

phttp='-p 8000:8000'
psmb='-p 445:445'

host=`hostname -I`
hn=`hostname`

echo
echo "[ホスト共有]"
echo "ホスト : $hostuser"
echo "ユーザ : $hostuser"
echo "共有１ : $hostshare1"
echo "共有２ : $hostshare2"
echo 
echo "[コンテナ共有]"
echo "ユーザ : $contuser"
echo "共有１ : $contshare1"
echo "共有２ : $contshare2"
echo 

echo "host($hn) : $host"
echo "http port forwarding = $httpfw $phttp" 
echo "samba port forwarding = $smbfw $psmb" 
echo

#　コンテナ削除
docker stop $contname
docker rm   $contname

#　コンテナ実行
if [ $httpfw != "yes" ]; then
  phttp=
fi
if [ $smbfw != "yes" ]; then
  psmb=
fi

docker run $phttp $psmb \
 -it \
 --name $contname \
 --mount type=bind,src=$hostshare1,target=$contshare1 \
 --mount type=bind,src=$hostshare2,target=$contshare2 \
 $imgname
#
