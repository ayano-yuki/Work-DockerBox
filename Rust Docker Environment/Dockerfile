FROM debian:bullseye-slim

# 開発ツールとRustのインストールに必要なツールをインストール
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    pkg-config \
    libssl-dev \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# RustupでRustをインストール（stable toolchain）
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /app

# Cargo.tomlとソースコードをコピー
COPY . .

# 依存関係を先に解決（キャッシュ利用）
RUN cargo fetch

# ビルド
RUN cargo build --release

# コンテナ起動時にbashへ
CMD ["bash"]
