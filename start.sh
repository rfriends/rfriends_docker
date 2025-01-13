#!/bin/bash
#
if [ ! -d $contshare/usr2 ]; then
  mkdir $contshare/usr2
fi
#
sudo service cron start
sudo service atd start
#
# built in web server
#hn=`hostname -i`:8000
#echo $hn > $HOME/rfriends3/rfriends3_server.txt
#sh $HOME/rfriends3/rfriends3_server.sh
#
# lighttpd
sudo service lighttpd start
# don't exit
#while :; do sleep 10; done
#
echo server exit
