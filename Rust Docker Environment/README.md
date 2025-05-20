# Rust Docker Environment
このプロジェクトは、任意のRustプログラムをDocker環境でビルド・実行するための軽量な環境です。

## ディレクトリ構成
Rustのソースコード（`Cargo.toml` や `src` ディレクトリ）を以下のように、`Dockerfile`と同じ階層に置いてください。
```
.
├── Dockerfile
├── Cargo.toml        # Rustのプロジェクト設定ファイル
├── src
│   └── main.rs       # メインのRustソースコード例
└── README.md
```

## セットアップ手順
1. Dockerイメージをビルド
    ```bash
    docker build -t rust-env .
    ```
1. コンテナを起動（カレントディレクトリをマウント）
    ```bash
    docker run -it --rm -v $(pwd):/app rust-env
    ```
    
    ※ Windows PowerShell の場合：
    ```powershell
    docker run -it --rm -v ${PWD}:/app rust-env
    ```

## 使用方法（コンテナ内）
起動後、bashシェルが立ち上がるので、任意のコマンドを実行できます。
```bash
cargo build --release      # リリースビルドを行う
./target/release/myapp     # ビルド済みバイナリを実行（myappはCargo.tomlのnameに対応）
cargo run                  # ビルドと実行をまとめて行う
行
```

