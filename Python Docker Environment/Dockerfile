# ビルド用ステージ（依存のインストールのみ）
FROM python:3.11.12-slim-bullseye AS builder
WORKDIR /install

COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# 実行用ステージ（実行に必要なものだけ含める）
FROM python:3.11.12-slim-bullseye
WORKDIR /app

# ビルドステージから必要なファイルだけコピー
COPY --from=builder /install /usr/local
COPY . .

CMD ["bash"]
