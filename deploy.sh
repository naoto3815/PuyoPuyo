#!/bin/bash
# puyo.html を GitHub Pages に自動反映するスクリプト
# 使い方: bash deploy.sh ["コミットメッセージ"]
set -e

SRC="/Users/koganaoto/Downloads/puyo.html"
REPO="/Users/koganaoto/Downloads/puyo-game"
MSG="${1:-update puyo $(date '+%Y-%m-%d %H:%M')}"

cp "$SRC" "$REPO/index.html"
cd "$REPO"

if git diff --quiet -- index.html; then
  echo "変更なし: プッシュをスキップしました"
  exit 0
fi

git -c user.name="naoto3815" -c user.email="naoto3815@gmail.com" commit -q -am "$MSG"
git push -q origin main
echo "✅ 反映しました: https://naoto3815.github.io/PuyoPuyo/  （数十秒で公開版に反映）"
