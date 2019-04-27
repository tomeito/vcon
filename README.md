# バーチャルミス・ミスターコンテスト

## コマンド
* Google スプレットシートからcsvファイルをダウンロード
```bash
$ bundle exec rails drive:answer_load
```
※csvから画像、エントリー者情報を読み込むのはseedで可能です

## Dockerのセットアップ
```bash
$ docker-compose build
$ docker-compose run vcon-web bundle exec rails drive:answer_load db:setup
$ docker-compose up
```