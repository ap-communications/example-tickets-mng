# Rails, ElasticSearchを使ったアプリののサンプル

## 起動方法

```shell
cd (このアプリのディレクトリ)

# コンテナビルド・起動
docker-compose pull
docker-compose build
docker-compose up -d

# up 完了後、DB等が起動するまで数分かかる

# モジュール類インストール
docker-compose exec app bundle install
docker-compose exec app npm install

# DBスキーマ作成、データ投入、最初のIndex作成
docker-compose exec app rails db:create
docker-compose exec app rails db:migrate
docker-compose exec app rails db:seed

# js関連ビルド
docker-compose exec app npm run build
# jsデバッグ時は別コンソールでこちらを使う
# docker-compose exec app npm run dev

# rails アプリ起動
docker-compose exec app rails s
```

## 起動されるアプリURL

- Rails アプリ
    - http://localhost:3000
- Kibana
    - http://localhost:5601
- PHP MyAdmin
    - http://localhost:3080

## Logstash使用

このサンプルでは Logstash と elasticsearch-model のつなぎこみができていない。

そのため、Logstashの挙動だけ確認したい場合は下記のようにする。

1. MariaDBクライアントをダウンロードし [docker/logstash/lib/](./docker/logstash/lib/) に置く
```
url https://downloads.mariadb.com/Connectors/java/connector-java-2.6.0/mariadb-java-client-2.6.0.jar -o docker/logstash/lib/mariadb-java-client.jar
```
2. [docker-compose.yml](./docker-compose.yml) の services.logstash 部分のコメントを外し下記を実行
```shell
docker-compose up -d
```


設定ファイルは [docker/logstash/pipeline](./docker/logstash/pipeline) にある
