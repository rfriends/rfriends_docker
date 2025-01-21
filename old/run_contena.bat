@echo off
rem
rem コンテナ実行
rem --------------------------------------------------------
rem ホスト側の共有ディレクトリ
set hostuser=%USERNAME%
set cdir=%~dp0..\
set hostshare1=%cdir%share\smbdir\usr2
set hostshare2=%cdir%share\rfriends3\config

rem コンテナ側の共有ディレクトリ
set contuser=user
set contshare1=/home/%contuser%/smbdir/usr2
set contshare2=/home/%contuser%/rfriends3/config

if not exist %hostshare1%\ (
  mkdir %hostshare1%
)
if not exist %hostshare2%\ (
  mkdir %hostshare2%
)

if %httpfw% neq yes (
  set phttp=
)
if %smbfw% neq yes (
  set psmb=
)

rem　コンテナ削除
docker stop %contname%
docker rm   %contname%

echo.
echo [ホスト共有]
echo ユーザ  : %hostuser%
echo 共有１ : %hostshare1%
echo 共有２ : %hostshare2%

echo.
echo [コンテナ共有]
echo ユーザ : %contuser%
echo 共有１ : %contshare1%
echo 共有２ : %contshare2%

echo.
echo http port forwarding = %httpfw% %phttp%
echo samba port forwarding = %smbfw% %psmb%

echo.
echo host IPaddress :
for /F "delims=: tokens=2" %%i in ('ipconfig ^|findstr /i "IPv4" ') do @echo %%i
echo.

rem コンテナ実行
docker run %phttp% %psmb% ^
 -it ^
 --name %contname% ^
 --mount type=bind,src=%hostshare1%,target=%contshare1% ^
 --mount type=bind,src=%hostshare2%,target=%contshare2% ^
 %imgname%
rem
exit /b
