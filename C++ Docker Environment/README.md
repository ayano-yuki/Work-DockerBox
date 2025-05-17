# C++ Docker Environment
このプロジェクトは、任意のC++プログラムをDocker環境でコンパイル・実行するための軽量な環境です。`apt-packages.txt`に外部ライブラリ（aptパッケージ）を記述しておくことで簡単に依存関係を管理でき、コンテナ起動時にbashが立ち上がり好きにコマンドを実行できます。

## ディレクトリ構成
C++のソースコードを以下のディレクトリ構成のように、`Dockerfile`や`apt-packages.txt`と同じ階層に置いてください。

```
.
├── Dockerfile
├── apt-packages.txt  # （任意）外部ライブラリリスト
├── prog.cpp          # コンパイル対象のC++ソースファイル例
|    ***
└── README.md
```

## セットアップ手順
1. Dockerイメージをビルド
    ```bash
    docker build -t cpp-env .
    ```
1. コンテナを起動（カレントディレクトリをマウント）
    ```bash
    docker run -it --rm -v $(pwd):/app cpp-env
    ```
    
    ※ Windows PowerShell の場合：
    ```powershell
    docker run -it --rm -v ${PWD}:/app cpp-env
    ```

## 使用方法（コンテナ内）
起動後、bashシェルが立ち上がるので、任意のスクリプトを実行できます。
```bash
./prog     # ビルド済みの実行ファイルを実行
```

起動後にプログラムをビルドする事もできます。
```bash
make
```

## requirements.txt の例
必要なモジュールを記述します：
```txt
libssl-dev
libcurl4-openssl-dev
```