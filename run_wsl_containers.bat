@echo off
call load_env.bat
mkdir -p %share_dir%\smbdir\usr2
mkdri -p %share_dir%\rfriends3\config

wslc run -d --name %container_name% -p %http_port%:8000 -v "%share_dir%\smbdir\usr2:/home/user/smbdir/usr2" -v "%share_dir%\rfriends3\config:/home/user/rfriends3/config" %image_name%
