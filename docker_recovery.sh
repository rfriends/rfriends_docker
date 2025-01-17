echo
echo ----- recovery start
echo

# recovery crontab
if [ -f $contshare2/crontab.conf ]; then
   crontab -u $user $contshare2/crontab.conf
   echo "crontabを復元しました。"
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
sh $fl 0 $opt 
echo デイリー処理を終了しました

echo
echo ----- recovery end
echo
