@echo off
call load_env.bat
echo wslc run -d --name %CONTAINER_NAME% -p %PORT%:8000 -v "%SHAREDIR%smbdir\usr:/home/user/smbdir/usr" %IMAGE%
