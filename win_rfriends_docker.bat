@echo off
rem
rem コンテナ実行 for win
rem --------------------------------------------------------
rem コンテナとイメージ
set contname=rfriends3
set imgname=rfriends3

rem ポートフォワーディング
rem no にすると同一LANからアクセス不可だが複数のコンテナが実行可能
rem windows環境の場合は、例　smbfw=no or 8445:445
set httpfw=yes
set smbfw=no
rem
set phttp=-p 8000:8000
set psmb=-p 445:445

rem --------------------------------------------------------
rem イメージ作成
docker build ./ -t %imgname%

rem
call run_contena.bat
rem
echo.
echo exit win_rfriends_docker

pause
exit
