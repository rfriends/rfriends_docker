@echo off
:: 1. 設定ファイルをインクルード
call load_env.bat
:: 2. wslcの実行
echo wslc run -d --name %CONTAINER_NAME% -p %PORT%:8000 -v "%SHAREDIR%smbdir\usr:/home/user/smbdir/usr" %IMAGE%
