#!/bin/bash
#
if [ ! -d $contshare1 ]; then
  mkdir -p $contshare1
  echo mkdir -p $contshare1
fi
#
cat <<EOF > $contshare2/usrdir.ini
usrdir = "$contshare1"
tmpdir = "$chome/tmp/"
EOF

hn=`hostname -i`:$port
echo "container IPaddress : $hn"
echo $hn > $chome/rfriends3/rfriends3_server.txt
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
