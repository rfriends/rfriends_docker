rfriends_dockerはdocker環境でrfriends3を動作させるスクリプトです。  
  
コンテナを終了しても、$HOME/share/smbdir/usr2 以下に録音データが保存されます。     
  
$ cd ~/  
$ sudo apt-get -y install git  
$ rm -rf rfriends_docker  
$ git clone https://github.com/rfriends/rfriends_docker.git  
$ cd rfriends_docker   

Docker Engineの場合  
$ docker compose up
~~$ sh rfriends_docker.sh~~  
  
Docker Desktop for windowsの場合  
$ sh rfriends_docker_win.sh  
  
Docker Desktop for macOSの場合  
$ sh rfriends_docker_mac.sh  
  
詳細なインストール方法は以下を参照してください。  
[dockerでrfriends3の実行環境を作成してラジオ番組を録音する](https://github.com/rfriends/rfriends_docker/wiki)   
