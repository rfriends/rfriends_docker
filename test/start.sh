
#!/bin/bash
#
contshare1=/home/$user/smbdir/usr2
contshare2=/home/$user/rfriends3/config
#
if [ ! -d $contshare1 ]; then
  mkdir -p $contshare1
fi
#
cat <<EOF > $contshare2/usrdir.ini
usrdir = "$contshare1"
tmpdir = "/home/$user/tmp/"
EOF

hn=`hostname -i`:$port
echo $hn > /home/$user/rfriends3/rfriends3_server.txt
#
sudo service cron start
sudo service atd start
#
# lighttpd web server
sudo service lighttpd start

# samba server
sudo service smbd start

echo
echo "container IPaddress : $hn"

# don't exit
while true; do sleep 10; done
#
echo server exit
