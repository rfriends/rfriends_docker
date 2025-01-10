rfriends_dockerはdocker環境でrfriends3を動作させるスクリプトです。  
  
cd ~/  
sudo apt-get install git  
rm -rf rfrends_docker  
git clone https://github.com/rfriends/rfriends_docker.git    
cd rfriends_docker  
docker build ./ -t rfriends3

docker run --rm -it rfriends3
表示されたIPアドレスに従って、Webブラウザで　http://IPアドレス:8000 にアクセスする。
  
インストール方法は以下を参照してください。  
[dockerで「rfriendsでラジオ録音」rfriends3 版](https://github.com/rfriends/rfriends_docker/wiki)   
また、Docker環境は終了するとデータも消えてしまうのでご注意ください。  
