#!/bin/zsh
source ./load_env.sh
mkdir -p ${share_dir}/smbdir/usr2
mkdir -p ${share_dir}/rfriends3/config
container build --platform linux/arm64 -t ${image_name} .

load-module module-native-protocol-tcp auth-anonymous=1 port=${pulse_port} listen=127.0.0.1
pulseaudio --start

container run -d --name "${container_name}" \
 -p "${http_port}":8000 \
 -v "${share_dir}/smbdir/usr2:/home/user/smbdir/usr2" \
 -v "${share_dir}/rfriends3/config:/home/user/rfriends3/config" \
 -e "PULSE_SERVER=tcp:${host_ip_address}:${pulse_port}" \ 
 "${image_name}"
