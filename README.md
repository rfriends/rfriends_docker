rfriends_dockerはdocker環境でrfriends3を動作させるスクリプトです。  
  
コンテナを終了させても、ホストのrfriends_dockerに録音データ、パラメータ設定が保存されています。  
  
rfriends_docker/share/smbdir/usr2  
rfriends_docker/share/rfriends3/config   
  
$ cd ~/  
$ sudo apt-get -y install git  
$ rm -rf rfriends_docker  
$ git clone https://github.com/rfriends/rfriends_docker.git  
$ cd rfriends_docker   
$ docker compose up  
  
詳細なインストール方法は以下を参照してください。  
https://rfriends.github.io/rfriends/distro/docker.html
