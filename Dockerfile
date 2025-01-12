# Dockerfile for rfriends
# 2023/07/09
# 2023/07/29 20.04 -> 22.04
# 2025/01/10 24.04
#
FROM ubuntu:24.04

# 文字化け対策
ENV LANG=C.UTF-8
ENV LANGUAGE=en_US

# タイムゾーン設定
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# rfriends3 
ENV SITE=https://github.com/rfriends/rfriends3/releases/latest/download
ENV SCRIPT=rfriends3_latest_script.zip

# rfriends用アプリのインストール
RUN apt-get update && apt-get -y install \
unzip nano vim dnsutils iproute2 tzdata \
at cron wget curl atomicparsley \
php-cli php-xml php-zip php-mbstring php-json php-curl php-intl \
ffmpeg

# lighttpd
RUN apt-get -y install lighttpd lighttpd-mod-webdav php-cgi
RUN mkdir -p /lighttpd/uploads

COPY 15-fastcgi-php.conf /etc/lighttpd/conf-available/.
COPY lighttpd.conf /etc/lighttpd/.

RUN lighttpd-enable-mod fastcgi && \ 
lighttpd-enable-mod fastcgi-php

# rfriends3のインストール
RUN wget ${SITE}/${SCRIPT} && unzip ${SCRIPT}

RUN ln -nfs /rfriends3/script/html/temp /rfriends3/script/html/webdav && \ 
echo lighttpd > /rfriends3/rfriends3_boot.txt

COPY start.sh .

# rfriends3_server.txt 作成,server start
ENTRYPOINT ["sh","./start.sh"]
CMD ["/bin/bash"]
