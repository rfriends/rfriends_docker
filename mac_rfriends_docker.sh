#!/bin/sh
#
# コンテナ実行 for macOS
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

hostip=`ip a | grep "inet " | grep -v "127.0.0.1"`
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
echo exit rfriends_docker.sh
exit 0
