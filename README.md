rfriends_dockerはdocker環境でrfriends3を動作させるスクリプトです。  
  
2026/07/21 wsl containers, apple container対応スクリプトを追加しました。  
2026/05/07 混乱しないようにshareディレクトリの位置を$HOME内からrfriends_docker内に変更しました。  

## １．docker  
  
```  
$ cd ~/  
$ sudo apt-get -y install git  
$ rm -rf rfriends_docker  
$ git clone https://github.com/rfriends/rfriends_docker.git  
$ cd rfriends_docker   
$ docker compose up  
```
  
## ２．WSL Containers    
  
コマンドプロンプトを開く。  
```
c:
cd temp   <-- 環境に応じて変更してください。
curl -L -o repo.zip https://github.com/rfriends/rfriends_docker/archive/refs/heads/main.zip
tar.exe -xf repo.zip
cd rfriends_docker
wslc build -t rfriends3 . 
run_wsl_containers.bat
```  
    
## ３．Apple Container    
  
```
% cd ~/  
% brew install git  
% rm -rf rfriends_docker  
% git clone https://github.com/rfriends/rfriends_docker.git  
% cd rfriends_docker
% container build --platform linux/arm64 -t rfriends3 .
% sh run_apple_container.sh
```  
  
## ４．その他  
  
コンテナを終了させても、ホストのrfriends_dockerに録音データ、パラメータ設定が保存されています。  
  
rfriends_docker/share/smbdir/usr2  
rfriends_docker/share/rfriends3/config   
  
詳細なインストール方法は以下を参照してください。  
https://rfriends.github.io/rfriends/distro/docker.html  

