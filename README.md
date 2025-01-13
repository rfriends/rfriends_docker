rfriends_dockerはdocker環境でrfriends3を動作させるスクリプトです。  
  
## １．イメージ作成  
$ git https://github.com/rfriends/rfriends_docker.gi  
$ cd rfriends_docker  
  
ホストで  
$ id  
uid=1000(user) gid=1000(user)  
を実行し  
Dockerfileのuid,gidを設定してください  
ENV uid=1000  
ENV gid=1000  
  
$ docker build ./ -t rfriends3  
  
## ２．実行  
  
$ sh ex_docker.sh  
  
実行画面に  
172.17.0.2:8000  
のように表示されるので、ブラウザにそれを入力すれば、rfriends3が表示されます。  
  
## ３．共有ディレクトリ    
  
$HOME/share/usr2 以下に録音データが保存されており、  
このデータはコンテナが終了しても残っています。    
ただし、予約、録音途中のデータは消えます。   
  
## ４．その他  
  
ホストはubuntuでしかテストしていません。  
Windowsホストでは一部修正が必要だと思います。  

  
詳細なインストール方法（古い）は以下を参照してください。  
[dockerで「rfriendsでラジオ録音」rfriends3 版](https://github.com/rfriends/rfriends_docker/wiki)   
