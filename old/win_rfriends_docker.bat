@echo off
rem
rem �R���e�i���s for win
rem --------------------------------------------------------
rem �R���e�i�ƃC���[�W
set contname=rfriends3
set imgname=rfriends3

rem �|�[�g�t�H���[�f�B���O
rem no �ɂ���Ɠ���LAN����A�N�Z�X�s���������̃R���e�i�����s�\
rem windows���̏ꍇ�́A��@smbfw=no or 8445:445
set httpfw=yes
set smbfw=no
rem
set phttp=-p 8000:8000
set psmb=-p 445:445

rem --------------------------------------------------------
rem �C���[�W�쐬
docker build ./ -t %imgname%

rem
call run_contena.bat
rem
echo.
echo exit win_rfriends_docker

pause
exit
