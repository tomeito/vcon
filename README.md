# バーチャルミス・ミスターコンテスト

## コマンド
* Google スプレットシートからcsvファイルをダウンロードおよび更新
```bash
$ bundle exec rails drive:answer_load
```
※csvからエントリー者情報を読み込むのはseedで可能です

## Dockerのセットアップ
```bash
$ docker-compose build
$ docker-compose run vcon-web bundle exec rails drive:answer_load db:setup
$ docker-compose up
```

## productionの注意！！！！！
* 画像の変更をしたとき
```bash
$ docker-compose run vcon-web bundle exec rake assets:precompile RAILS_ENV=production
```
