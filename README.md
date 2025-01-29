rfriends_dockerはdocker環境でrfriends3を動作させるスクリプトです。  
  
コンテナを終了しても、$HOME/share/smbdir/usr2 以下に録音データが保存されます。     
  
$ cd ~/  
$ sudo apt-get -y install git  
$ rm -rf rfriends_docker  
$ git clone https://github.com/rfriends/rfriends_docker.git  
$ cd rfriends_docker   
$ docker compose up  
  
詳細なインストール方法は以下を参照してください。  
https://github.com/rfriends/rfriends/blob/gh-pages/distro/docker.md  
  
   


