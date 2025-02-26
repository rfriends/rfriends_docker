#!/bin/bash
#
contshare1=/home/$user/smbdir/usr2
contshare2=/home/$user/rfriends3/config
#
if [ ! -d $contshare1 ]; then
  mkdir -p $contshare1
fi
sudo chown -R $user:$user $contshare1
sudo chown -R $user:$user $contshare2

#
cat <<EOF > $contshare2/usrdir.ini
usrdir = "$contshare1/"
tmpdir = "/home/$user/tmp/"
EOF

rfriends3dir=/home/$user/rfriends3

host=`hostname -i`
hn=`hostname`
echo ${host}:${port} > $rfriends3dir/rfriends3_server.txt
echo
echo "container IPaddress : 
echo $host"
#
echo
date
sudo service cron start
sudo service atd start
#
# lighttpd web server
sudo service lighttpd start

# samba server
sudo service smbd start

recoverysw="on"

if [ $recoverysw = "on" ]; then

echo
echo ----- recovery start

# recovery crontab
if [ -f $contshare2/crontab.conf ]; then
   crontab -u $user $contshare2/crontab.conf
   echo "crontab設定を復元しました"
else
   echo "crontab設定がされていません"
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
opt="1,1,0,0,0,0,0"
#
fl="$rfriends3dir/script/ex_rfriends.sh"
sh $fl 0 $opt > /dev/null &
echo デイリー処理をバックグラウンドで処理中です
echo ----- recovery end

fi

echo
echo rfriends3が使用できます。

# don't exit
while true; do sleep 10; done
#
echo server exit
