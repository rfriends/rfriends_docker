#!/bin/sh
#
# コンテナ実行
# --------------------------------------------------------
# ホスト側の共有ディレクトリ
hostuser=`whoami`
cdir=`dirname $(pwd)`
hostshare1=$cdir/share/smbdir/usr2
hostshare2=$cdir/share/rfriends3/config

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

#　
if [ $httpfw != "yes" ]; then
  phttp=
fi
if [ $smbfw != "yes" ]; then
  psmb=
fi

#　コンテナ削除
docker stop $contname
docker rm   $contname

echo
echo "[ホスト共有]"
echo "ユーザ  : $hostuser"
echo "共有１ : $hostshare1"
echo "共有２ : $hostshare2"

echo 
echo "[コンテナ共有]"
echo "ユーザ : $contuser"
echo "共有１ : $contshare1"
echo "共有２ : $contshare2"

echo
echo "http port forwarding = $httpfw $phttp" 
echo "samba port forwarding = $smbfw $psmb" 

echo 
echo "host IPaddress :"
echo "$hostip"

# コンテナ実行
docker run $phttp $psmb \
 -it \
 --name $contname \
 --mount type=bind,src=$hostshare1,target=$contshare1 \
 --mount type=bind,src=$hostshare2,target=$contshare2 \
 $imgname
#
