#!/bin/bash
#
if [ ! -d $contshare/usr2 ]; then
  mkdir -p $contshare/usr2
  echo mkdir -p $contshare/usr2
fi
#
echo "port : $port"
echo $port > $HOME/rfriends3/rfriends3_port
hn=`hostname -i`:$port
echo "container address : $hn"
echo $hn > $HOME/rfriends3/rfriends3_server.txt
#
sudo service cron start
sudo service atd start
#
# builtin web server
#sh $HOME/rfriends3/rfriends3_server.sh
#
# lighttpd web server
sudo service lighttpd start
# don't exit
while :; do sleep 10; done
#
echo server exit
