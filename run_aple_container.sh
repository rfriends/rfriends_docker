#!/bin/zsh
source ./load_env.sh
container run -d --name "${CONTAINER_NAME}" -p "${http_port}":8000 -v "${share_dir}/smbdir/usr2:/home/user/smbdir/usr2" -v "${shre_dir}/rfriends3/config:/home/user/rfriends3/config" "${IMAGE}"
