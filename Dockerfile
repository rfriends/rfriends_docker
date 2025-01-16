# Dockerfile for rfriends
# 2023/07/09
# 2023/07/29 20.04 -> 22.04
# 2025/01/10 24.04
# 2025/01/12 lighttpd
# 2025/01/16 fix
#
FROM ubuntu:24.04
# 24.04で最初から存在するubuntuユーザを削除
RUN userdel ubuntu && rm -rf /home/ubuntu
#
# user設定（環境に応じて変更）
# uid,gidはホストの実行ユーザに合わせる
ENV user=user
ENV uid=1000
ENV gid=1000

# ポート番号は変更不可
ENV port=8000
EXPOSE $port

RUN apt-get update && apt-get install -y sudo
# $userを追加し、sudo,NOPASSWD
RUN groupadd -g $gid $user
RUN useradd -m -s /bin/bash -u $uid -g $gid -G sudo $user
RUN echo $user:$user | chpasswd
RUN echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 文字化け対策
ENV LANG=C.UTF-8
ENV LANGUAGE=en_US

# タイムゾーン(JST)設定
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# rfriends3 
ENV SITE=https://github.com/rfriends/rfriends3/releases/latest/download
ENV SCRIPT=rfriends3_latest_script.zip
ENV BASE=/home/$user/rfriends3

# rfriends用アプリのインストール
RUN apt-get -y install \
unzip nano vim dnsutils iproute2 tzdata \
at cron wget curl atomicparsley \
php-cli php-xml php-zip php-mbstring php-json php-curl php-intl \
ffmpeg

# lighttpd
RUN apt-get -y install lighttpd lighttpd-mod-webdav php-cgi
COPY 15-fastcgi-php.conf /etc/lighttpd/conf-available/.
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
RUN sed -i s%rfriendshomedir%/home/$user%g /etc/lighttpd/lighttpd.conf && \
    sed -i s%rfriendsuser%$user%g /etc/lighttpd/lighttpd.conf && \
    sed -i s%rfriendsport%$port%g /etc/lighttpd/lighttpd.conf
RUN mkdir -p /var/cache/lighttpd

USER $user
WORKDIR /home/$user

# rfriends3のインストール
RUN wget ${SITE}/${SCRIPT} && unzip ${SCRIPT}

RUN ln -nfs $BASE/script/html/temp $BASE/script/html/webdav && \ 
  echo lighttpd > $BASE/rfriends3_boot.txt && \
  mkdir -p $BASE/lighttpd/uploads && \
  mkdir /home/$user/tmp

RUN sudo lighttpd-enable-mod fastcgi && \ 
    sudo lighttpd-enable-mod fastcgi-php

COPY start.sh .

# rfriends3_server.txt 作成,server start
ENTRYPOINT ["sh","./start.sh"]
CMD ["/bin/bash"]
