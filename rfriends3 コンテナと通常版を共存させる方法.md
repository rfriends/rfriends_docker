すでにrfriends3がインストールされている環境にDocker版をインストールする方法について  
  
例えば、Linux 環境で、通常のrfriends3がインストールされているとします。  
rfriends3にはhttp://(IP):8000でアクセスできます。  
  
そこにDocker版をインストールすると、ポートが重なってうまくいきません。  
そこで、以下の手順でポートを変更してインストールします。  
  
```  
$ cd rfriends_docker  
$ vi .env  
http_port=8000 -> http_port=8001  
$ docker compose up  
```  
  
無事、http://(IP):8001でアクセスでき、共存が可能になります。  
  
以上  
