rfriends_dockerはdocker環境でrfriends3を動作させるスクリプトです。  
  
コンテナを終了しても、$HOME/share/smbdir/usr2 以下に録音データが保存されます。     
  
$ cd ~/  
$ sudo apt-get -y install git  
$ rm -rf rfriends_docker  
$ git clone https://github.com/rfriends/rfriends_docker.git  
$ cd rfriends_docker   
$ sh rfriends_docker.sh  
  
docker desktop(windows)の場合  
$ sh rfriends_docker_win.sh  
  
詳細なインストール方法は以下を参照してください。  
[dockerで「rfriendsでラジオ録音」rfriends3 版](https://github.com/rfriends/rfriends_docker/wiki)   
