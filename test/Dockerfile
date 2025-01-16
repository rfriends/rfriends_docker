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

USER $user
WORKDIR /home/$user

RUN rm -rf rfriends_ubuntu
RUN sudo apt-get install git -y  
RUN git clone https://github.com/rfriends/rfriends_ubuntu.git && \
  if [ $? != 0 ]; then \
    echo クローンに失敗しました。 \
    echo 少し時間をおいて再度実行してください。 \
    exit 1 \
  fi

RUN　cd rfriends_ubuntu && \  
     sh rfriends_ubuntu.sh  

COPY start.sh .

# rfriends3_server.txt 作成,server start
ENTRYPOINT ["sh","./start.sh"]
CMD ["/bin/bash"]
