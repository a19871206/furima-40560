# テーブル設計

null: false
unique: true

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| email              | string | unique: true |
| password           | string | null: false  |
| encrypted_password | string | null: false  |
| nick_name          | string | unique: true |
| birth_date         | string | null: false  |
| last_name          | string | null: false  |
| first_name         | string | null: false  |
| last_name_kana     | string | null: false  |
| first_name_kana    | string | null: false  |

## Middles テーブル

| Column             | Type   | Options           |
| ------------------ | ------ | ----------------- |
| nick_name          | string | foreign_key: true | 
| item_id            | string | foreign_key: true | 
| seller_id          | string | foreign_key: true |

## Items テーブル

| Column             | Type   | Options            |
| ------------------ | ------ | ------------------ |
| nick_name          | string | foreign_key: true  |
| item_id            | string |                    | 
| image              | binary | limit: 4.megabytes |
| title              | string | null: false        | 
| explan             | string | null: false        | 
| category           | string | null: false        |
| condition          | string | null: false        |
| cost               | string | null: false        |
| shipping           | string | null: false        |
| region             | string | null: false        |
| delivery_date      | string | null: false        |

## Oder テーブル

| Column             | Type   | Options            |
| ------------------ | ------ | ------------------ |
|nick_name           | string | foreign_key: true  | 
|item_id             | string | foreign_key: true  | 
|seller_id           | string |                    |
|city                | string | null: false        |
|address             | string | null: false        |
|number              | string | null: false        |
|another             | string |                    |
|zip_code            | string | null: false        |
