# Dockerfile for rfriends
# 2023/07/09
# 2023/07/29 20.04 -> 22.04
# 2025/01/10 24.04
# 2025/01/12 lighttpd
# 2025/01/13 user
#
FROM ubuntu:24.04
RUN userdel ubuntu && rm -rf /home/ubuntu
#
# user設定（環境に応じて変更）
# uid,gidはホストの実行ユーザに合わせる
ENV user=user
ENV uid=1000
ENV gid=1000
ENV chome=/home/$user
ENV contshare=/tmp/share
#ENV contshare=$chome

# ポート番号は変更不可
ENV port=8000

RUN apt-get update && apt-get install -y sudo
RUN groupadd -g $gid $user
RUN useradd -m -s /bin/bash -u $uid -g $gid -G sudo $user
RUN echo $user:$user | chpasswd
RUN echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 文字化け対策
ENV LANG=C.UTF-8
ENV LANGUAGE=en_US

# タイムゾーン設定
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# rfriends3 
ENV SITE=https://github.com/rfriends/rfriends3/releases/latest/download
ENV SCRIPT=rfriends3_latest_script.zip

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
RUN sed -i s%rfriendshomedir%$chome%g /etc/lighttpd/lighttpd.conf && \
    sed -i s%rfriendsuser%$user%g /etc/lighttpd/lighttpd.conf && \
    sed -i s%rfriendsport%$port%g /etc/lighttpd/lighttpd.conf
RUN mkdir -p /var/cache/lighttpd

USER $user
WORKDIR $chome

# rfriends3のインストール
RUN wget ${SITE}/${SCRIPT} && unzip ${SCRIPT}

RUN ln -nfs $chome/rfriends3/script/html/temp $chome/rfriends3/script/html/webdav && \ 
  echo lighttpd > rfriends3/rfriends3_boot.txt && \
  mkdir -p lighttpd/uploads && \
  mkdir $chome/tmp

RUN cat <<EOF > $chome/rfriends3/config/usrdir.ini
usrdir = "$contshare/usr2/"
tmpdir = "$chome/tmp/"
EOF

RUN sudo lighttpd-enable-mod fastcgi && \ 
    sudo lighttpd-enable-mod fastcgi-php

COPY start.sh .

# rfriends3_server.txt 作成,server start
ENTRYPOINT ["sh","./start.sh"]
CMD ["/bin/bash"]
