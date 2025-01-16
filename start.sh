#!/bin/bash
#
contshare1=/tmp/share/usr2
contshare2=/home/$user/rfriends3/config
#
if [ ! -d $contshare1 ]; then
  mkdir -p $contshare1
  echo mkdir -p $contshare1
fi
#
cat <<EOF > $contshare2/usrdir.ini
usrdir = "$contshare1"
tmpdir = "/home/$user/tmp/"
EOF

hn=`hostname -i`:$port
echo "container IPaddress : $hn"
echo $hn > /home/$user/rfriends3/rfriends3_server.txt
#
sudo service cron start
sudo service atd start
#
# lighttpd web server
sudo service lighttpd start

# don't exit
while true; do sleep 10; done
#
echo server exit
