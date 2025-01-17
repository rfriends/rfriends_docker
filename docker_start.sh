#!/bin/bash
#
contshare1=/home/$user/smbdir/usr2
contshare2=/home/$user/rfriends3/config
#
if [ ! -d $contshare1 ]; then
  mkdir -p $contshare1
fi
#
cat <<EOF > $contshare2/usrdir.ini
usrdir = "$contshare1/"
tmpdir = "/home/$user/tmp/"
EOF

rfriends3dir=/home/$user/rfriends3

hn=`hostname -i`:$port
echo $hn > $rfriends3dir/rfriends3_server.txt
#
sudo service cron start
sudo service atd start
#
# lighttpd web server
sudo service lighttpd start

# samba server
sudo service smbd start

echo
echo "container IPaddress : $hn"
date

recoverysw="on"

if [ $recoverysw = "on" ]; then

echo
echo ----- recovery start
echo

# recovery crontab
if [ -f $contshare2/crontab.conf]; then
   crontab -u $user $contshare2/crontab.conf
   echo "crontabを復元しました。"
else
   echo "crontabファイルがありません。"
fi

# def
echo $contshare1."/"    > $rfriends3dir/etc/usrdef 
echo "/home/$user/tmp/" > $rfriends3dir/etc/tmpdef 

# daily process
# opt 1:on
#
# ラジコ予約
# らじる予約
# タイムフリー録音
# らじる聞き逃し録音
# らじるゴガク録音
# ポッドキャスト
# クリーン処理
opt="1,1,1,1,1,1,1"
#
fl="$rfriends3dir/script/ex_rfriends.sh"
echo デイリー処理を開始しました
echo 終了までしばらくお待ちください
sh $fl 0 $opt 
echo デイリー処理を終了しました

echo
echo ----- recovery end
echo

fi

# don't exit
while true; do sleep 10; done
#
echo server exit
