#!/bin/sh
#
# コンテナ実行 for linux
# --------------------------------------------------------
# コンテナとイメージ
contname=rfriends3
imgname=rfriends3

# ポートフォワーディング
# no にすると同一LANからアクセス不可だが複数のコンテナが実行可能
httpfw=yes
smbfw=yes
#
phttp='-p 8000:8000'
psmb='-p 445:445'

hostip=`hostname -I`
# --------------------------------------------------------
# イメージ作成
sudo chmod 666 /var/run/docker.sock
docker build ./ -t $imgname
#
export contname
export imgname
export httpfw
export smbfw
export phttp
export psmb
export hostip

#
sh run_contena.sh
#
echo
echo exit run_contena.sh
exit 0
