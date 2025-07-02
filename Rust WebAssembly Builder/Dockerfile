# Rustベースイメージ
FROM rust:latest

# wasm-packをインストール
RUN cargo install wasm-pack

# ビルド用作業ディレクトリ
WORKDIR /app

# ソースをコピー
COPY . .

# wasm-packビルド (ブラウザ用)
RUN wasm-pack build --release --target web
