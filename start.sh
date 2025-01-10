#!/bin/bash
hn=`hostname -i`:8000
echo $hn > rfriends3/rfriends3_server.txt
#cat rfriends3/rfriends3_server.txt
#sh -c "cat /etc/*-release"
cron &
atd &
sh rfriends3/rfriends3_server.sh 
echo server exit
