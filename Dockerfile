# Dockerfile for rfriends
# 2023/07/09
# 2023/07/29 20.04 -> 22.04
#
FROM ubuntu:22.04

# 文字化け対策
ENV LANG C.UTF-8
ENV LANGUAGE en_US

# タイムゾーン設定
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# rfriends用アプリのインストール

run apt update && apt -y install \
unzip nano vim dnsutils iproute2 tzdata \
at cron wget curl atomicparsley \
php-cli php-xml php-zip php-mbstring php-json php-curl php-intl \
ffmpeg

# rfriendsのダウンロードと展開(ホスト共有しないとき用)
#run wget http://rfriends.s1009.xrea.com/files3/rfriends3_latest_script.zip && \
#    unzip rfriends3_latest_script.zip

run wget http://rfriends.s1009.xrea.com/files3/rfriends3_latest_script.zip && \
    unzip rfriends3_latest_script.zip

COPY start.sh .

# rfriends3_server.txt 作成,server start
ENTRYPOINT ./start.sh
CMD ["/bin/bash"]
