# Python Docker Environment
このプロジェクトは、複数のPythonスクリプトをDocker環境で実行するための軽量な環境です。`requirements.txt`に依存関係を記述し、Dockerコンテナ内で簡単に実行・開発できます。

## ディレクトリ構成
pythonのプログラムを以下のディレクトリ構成のように、`Dockerfile`・`requirements.txt`と同じ階層においてください。一応、これらのファイルよりも下の階層でも動作します。

```
.
├── Dockerfile
├── requirements.txt
├── prog.py
|    ***
└── README.md
```

## セットアップ手順
1. Dockerイメージをビルド
    ```bash
    docker build -t python-env .
    ```
1. コンテナを起動（カレントディレクトリをマウント）
    ```bash
    docker run -it --rm -v $(pwd):/app python-env
    ```
    
    ※ Windows PowerShell の場合：
    ```powershell
    docker run -it --rm -v ${PWD}:/app python-env
    ```

## 使用方法（コンテナ内）
起動後、bashシェルが立ち上がるので、任意のスクリプトを実行できます。
```bash
python prog.py
```

## requirements.txt の例
必要なモジュールを記述します：
```txt
numpy
requests
```