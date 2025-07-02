#!/usr/bin/env bash

set -e

IMAGE_NAME="rust-wasm-pack"
CONTAINER_NAME="wasm_out"

echo
echo "==========================================="
echo "[1/4] Dockerイメージをビルド中..."
echo "==========================================="
docker build -t "$IMAGE_NAME" .

echo
echo "==========================================="
echo "[2/4] 一時コンテナを作成中..."
echo "==========================================="
docker create --name "$CONTAINER_NAME" "$IMAGE_NAME"

echo
echo "==========================================="
echo "[3/4] pkgフォルダを取得中..."
echo "==========================================="
if [ -d pkg ]; then
  echo "既存のpkgフォルダを削除します。"
  rm -rf pkg
fi

docker cp "$CONTAINER_NAME":/app/pkg ./pkg

echo
echo "==========================================="
echo "[4/4] 一時コンテナを削除中..."
echo "==========================================="
docker rm "$CONTAINER_NAME"

echo
echo "***********************************"
echo "ビルドとファイルコピーが完了しました。"
echo "./pkg フォルダに成果物があります。"
echo "***********************************"
