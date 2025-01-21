@echo off
rem
rem �R���e�i���s
rem --------------------------------------------------------
rem �z�X�g���̋��L�f�B���N�g��
set hostuser=%USERNAME%
set cdir=%~dp0..\
set hostshare1=%cdir%share\smbdir\usr2
set hostshare2=%cdir%share\rfriends3\config

rem �R���e�i���̋��L�f�B���N�g��
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

rem�@�R���e�i�폜
docker stop %contname%
docker rm   %contname%

echo.
echo [�z�X�g���L]
echo ���[�U  : %hostuser%
echo ���L�P : %hostshare1%
echo ���L�Q : %hostshare2%

echo.
echo [�R���e�i���L]
echo ���[�U : %contuser%
echo ���L�P : %contshare1%
echo ���L�Q : %contshare2%

echo.
echo http port forwarding = %httpfw% %phttp%
echo samba port forwarding = %smbfw% %psmb%

echo.
echo host IPaddress :
for /F "delims=: tokens=2" %%i in ('ipconfig ^|findstr /i "IPv4" ') do @echo %%i
echo.

rem �R���e�i���s
docker run %phttp% %psmb% ^
 -it ^
 --name %contname% ^
 --mount type=bind,src=%hostshare1%,target=%contshare1% ^
 --mount type=bind,src=%hostshare2%,target=%contshare2% ^
 %imgname%
rem
exit /b
