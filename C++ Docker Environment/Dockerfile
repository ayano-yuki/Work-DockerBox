FROM debian:bullseye-slim

# 開発ツールとmakeをインストール
RUN apt-get update && apt-get install -y make build-essential

WORKDIR /app

# 外部ライブラリのインストール
COPY apt-packages.txt ./
RUN if [ -f apt-packages.txt ]; then \
      xargs -a apt-packages.txt apt-get install -y; \
    fi

# プログラムとMakefileを含むすべてのファイルをコピー
COPY . .

# コンテナ起動時にbashへ
CMD ["bash"]
