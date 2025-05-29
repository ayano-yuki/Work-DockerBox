# MySQL Docker Environment
このプロジェクトは、軽量なMySQL環境をDockerで構築し、永続化およびデータ出力（ダンプ）を可能にすることを目的としています。ローカル開発やテスト用のデータベース環境として活用できます。

## ディレクトリ構成
```
.
├── docker-compose.yml     # MySQL環境を定義するファイル
├── init/                  # 起動時に実行されるSQLファイルを格納
│   └── 01_init.sql        # 任意の初期化スクリプト（例）
├── backup.sh              # データのエクスポート（mysqldump）
└── README.md

```

## セットアップ手順
1. Dockerコンテナの起動
    ```bash
    docker-compose up -d
    ```

## 初期データ投入（任意）
init/ ディレクトリ内の *.sql ファイルは、コンテナ初回起動時に自動で実行されます。テーブル作成や初期データ投入に利用できます。

## データの永続化
MySQLデータはDocker Volume db_data に永続化されるため、コンテナを削除してもデータは保持されます。

ディレクトリを明示的に指定して永続化したい場合は、以下のように修正可能です：
```yaml
volumes:
  - ./mysql-data:/var/lib/mysql
```

## 使用方法（コンテナ内）
### コンテナへのアクセス
```sh
docker exec -it mysql mysql -u root -prootpass appdb
```

### データのエクスポート（mysqldump）
backup.sh を使って dump.sql にデータベースをエクスポートできます。

backup.sh の内容例：
```sh
#!/bin/bash
docker exec -i mysql \
  mysqldump -u root -prootpass appdb > dump.sql
```

実行権限を与えて使ってください：
```sh
chmod +x backup.sh
./backup.sh
```

### クリーンアップ
``` sh
docker-compose down -v  # コンテナとボリュームを削除
```