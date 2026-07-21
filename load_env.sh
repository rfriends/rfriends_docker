#!/bin/zsh
# .envファイルを読み込み、#で始まるコメント行や空行を除外してエクスポート
#if [ -f .env ]; then
#    export $(grep -v '^#' .env | xargs)
#fi

# パスにスペースを含む場合も考慮
#
if [ -f .env ]; then
    # 空行とコメント行（#）を除外して1行ずつ読み込む
    set -a
    while IFS= read -r line || [ -n "$line" ]; do
        # コメントと空行を無視
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "${line//[[:space:]]/}" ]] && continue
        eval "export $line"
    done < .env
    set +a
fi
