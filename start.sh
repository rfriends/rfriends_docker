#!/bin/bash
#
sh -c "cat /etc/*-release"
cron &
atd &
echo server 
exit
