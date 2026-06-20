#!/bin/bash
# puyo.html(と連鎖ボイス voice/) を GitHub Pages に自動反映するスクリプト
# 使い方: bash deploy.sh ["コミットメッセージ"]
set -e

SRC="/Users/koganaoto/Downloads/puyo.html"
SRC_VOICE="/Users/koganaoto/Downloads/voice"   # 連鎖ボイスmp3の置き場(任意。あればコピー)
REPO="/Users/koganaoto/Downloads/puyo-game"
MSG="${1:-update puyo $(date '+%Y-%m-%d %H:%M')}"

cp "$SRC" "$REPO/index.html"

# 連鎖ボイス(voice/0.mp3〜6.mp3)があれば公開フォルダへ同期
if [ -d "$SRC_VOICE" ]; then
  mkdir -p "$REPO/voice"
  cp -f "$SRC_VOICE"/*.mp3 "$REPO/voice/" 2>/dev/null || true
fi

cd "$REPO"
git add -A   # index.html と voice/ の追加・変更をまとめてステージ

if git diff --cached --quiet; then
  echo "変更なし: プッシュをスキップしました"
  exit 0
fi

git -c user.name="naoto3815" -c user.email="naoto3815@gmail.com" commit -q -m "$MSG"
git push -q origin main
echo "✅ 反映しました: https://naoto3815.github.io/PuyoPuyo/  （数十秒で公開版に反映）"
