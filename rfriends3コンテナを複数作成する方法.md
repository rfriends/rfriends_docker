保証外になりますが、  
rfriends3コンテナを複数作成する場合のやり方について説明します。  
以下の説明が理解できない場合はあきらめてください。  
不具合報告は歓迎です。  
  
1) test1以下にクローンします。  
以前のファイルから更新されているので、必ず新しくクローンしてください。  
  
```  
cd ~/  
mkdir test1  
git clone https://github.com/rfriends/rfriends_docker.git   
```  
  
2) test1をtest2にコピーします。  
  
```  
cd ~/  
cp -r test1 test2  
```  
  
3) test1の.envファイルを編集します。  
  
```  
cd ~/test1/rfriends_docker  
vi .env  
COMPOSE_PROJECT_NAME=rfriends3_test1  
http_port=8000  
```  
  
4) test2の.envファイルを編集します。  
  
```  
cd ~/test2/rfriends_docker  
vi .env  
COMPOSE_PROJECT_NAME=rfriends3_test2  
http_port=8001  
```  
  
5) test1のrfriends3コンテナを作成します。  
  
```  
cd ~/test1/rfriends_docker  
docker compose up  
```  
  
6) test2のrfriends3コンテナを作成します。  
別のターミナルを開いて  
  
```  
cd ~/test2/rfriends_docker  
docker compose up  
```  
  
7) これで、2つのrfriends3にアクセスできます。  
  
```  
http://ipアドレス:8000  
http://ipアドレス:8001  
```  
  
以上  
