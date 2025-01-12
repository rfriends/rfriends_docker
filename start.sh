#!/bin/bash
hn=`hostname -i`:8000
HOME=/home/ubuntu
echo $hn > $HOME/rfriends3/rfriends3_server.txt
#cat $HOME/rfriends3/rfriends3_server.txt
#sh -c "cat /etc/*-release"
service cron start
service atd start
service lighttpd start

#sh $HOME/rfriends3/rfriends3_server.sh 
echo server exit
