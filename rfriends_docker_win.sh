#!/bin/sh
#
# コンテナ実行 for win
# --------------------------------------------------------
# コンテナとイメージ
contname=rfriends3
imgname=rfriends3

# ポートフォワーディング
# no にすると同一LANからアクセス不可だが複数のコンテナが実行可能
# windows環境の場合は、例　smbfw=no or 8445:445
httpfw=yes
smbfw=no
#
phttp='-p 8000:8000'
psmb='-p 445:445'

hostip=`ipconfig | grep "inet " | grep -v "127.0.0.1"`
# --------------------------------------------------------
# イメージ作成
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
echo exit rfriends_docker_win.sh
exit 0
