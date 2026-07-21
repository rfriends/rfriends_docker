#!/bin/zsh
# 1. 設定ファイルをインクルード
source ./load_env.sh

# 2. コンテナの実行（dockerまたはpodmanを想定し、変数を展開してエコー）
echo container run -d --name "${CONTAINER_NAME}" -p "${http_port}":8000 -v "${share_dir}smbdir/usr2:/home/user/smbdir/usr2" -v "${shre_dir}rfriends3/config:/home/user/rfriends3/config" "${IMAGE}"
