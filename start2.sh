#!/bin/bash
hn=`hostname -i`:8000
HOME=/home/ubuntu
#
sudo service cron start
sudo service atd start
#
# built in web server
#echo $hn > $HOME/rfriends3/rfriends3_server.txt
#sh $HOME/rfriends3/rfriends3_server.sh
#
# lighttpd
sudo service lighttpd start
# don't exit
while :; do sleep 10; done
#
echo server exit
