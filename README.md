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
