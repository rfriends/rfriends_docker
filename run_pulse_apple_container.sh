#!/bin/zsh
# 2026/07/23
exit
source ./load_env.sh
mkdir -p ${share_dir}/smbdir/usr2
mkdir -p ${share_dir}/rfriends3/config
container build --platform linux/arm64 -t ${image_name} .

killall pulseaudio 2>/dev/null
pulseaudio --daemon
#pulseaudio --load=module-coreaudio-detect --load=module-native-protocol-tcp="auth-anonymous=1 port=4713" --exit-idle-time=-1 --daemon


container run -d --name "${container_name}" \
 -p "${http_port}":8000 \
 -v "${share_dir}/smbdir/usr2:/home/user/smbdir/usr2" \
 -v "${share_dir}/rfriends3/config:/home/user/rfriends3/config" \
 -e "PULSE_SERVER=tcp:${host_ip_address}:${pulse_port}" \ 
 -e -e PULSE_SINK=${pulse_sink} \
 "${image_name}"
