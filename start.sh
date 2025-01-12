#!/bin/bash
hn=`hostname -i`:8000
echo $hn > rfriends3/rfriends3_server.txt
#cat rfriends3/rfriends3_server.txt
#sh -c "cat /etc/*-release"
service cron start
service atd start
service lighttpd start

#sh rfriends3/rfriends3_server.sh 
echo server exit
