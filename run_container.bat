@echo off
call load_env.bat
echo wslc run -d --name %COMPOSE_PROJECT_NAME% -p %http_port%:8000 -v "%share_dir%\smbdir\usr2:/home/user/smbdir/usr2" -v "%share_dir%\rfriends3\config:/home/user/rfriends3/config" %IMAGE%
