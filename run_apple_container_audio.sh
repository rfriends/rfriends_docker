#!/bin/zsh
#  動作しません。
exit
source ./load_env.sh
mkdir -p ${share_dir}/smbdir/usr2
mkdir -p ${share_dir}/rfriends3/config
container build --platform linux/arm64 -t ${image_name} .
container run -d --name "${container_name}" -p "${http_port}":8000 -v "${share_dir}/smbdir/usr2:/home/user/smbdir/usr2" -v "${share_dir}/rfriends3/config:/home/user/rfriends3/config" "${image_name}"
