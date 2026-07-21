#!/bin/zsh
mkdir -p ./share/rfriends3/config
mkdir -p ./share/smbdir/usr2
source ./load_env.sh
container run -d --name "${container_name}" -p "${http_port}":8000 -v "${share_dir}/smbdir/usr2:/home/user/smbdir/usr2" -v "${shre_dir}/rfriends3/config:/home/user/rfriends3/config" "${image_name}"
