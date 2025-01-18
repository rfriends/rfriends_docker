#!/bin/sh
#
# コンテナ実行
# --------------------------------------------------------
# コンテナとイメージ
contname=rfriends3
imgname=rfriends3

# ポートフォワーディング
# no にすると同一LANからアクセス不可だが複数のコンテナが実行可能
# windows環境の場合は、smbfw=no (必須)
httpfw=yes
smbfw=yes
#
phttp='-p 8000:8000'
psmb='-p 445:445'

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

hostip=`hostname -I`

echo
echo "[ホスト共有]"
echo "ユーザ  : $hostuser"
echo "IPaddr : $hostip"
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

#　コンテナ削除
docker stop $contname
docker rm   $contname

# コンテナ実行
docker run $phttp $psmb \
 -it \
 --name $contname \
 --mount type=bind,src=$hostshare1,target=$contshare1 \
 --mount type=bind,src=$hostshare2,target=$contshare2 \
 $imgname
#
