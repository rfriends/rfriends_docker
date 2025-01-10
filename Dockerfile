# Dockerfile for rfriends
# 2023/07/09
# 2023/07/29 20.04 -> 22.04
# 2025/01/10 22.04 -> 24.04,github
#
FROM ubuntu:24.04

# 文字化け対策
ENV LANG C.UTF-8
ENV LANGUAGE en_US

# タイムゾーン設定
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# rfriendsのインストール

run apt-get git -y
run cd ~/
run rm -rf rfriends_ubuntu
run git clone https://github.com/rfriends/rfriends_ubuntu
run cd rfriends_ubuntu
run sh rfriends_ubuntu

COPY start.sh .

# rfriends3_server.txt 作成,server start
ENTRYPOINT ./start.sh
CMD ["/bin/bash"]
