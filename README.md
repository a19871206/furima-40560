# テーブル設計

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| email              | string | null: false  |
| encrypted_password | string | null: false  |
| nick_name          | string | unique: true |
| birth_date         | date   | null: false  |
| last_name          | string | null: false  |
| first_name         | string | null: false  |
| last_name_kana     | string | null: false  |
| first_name_kana    | string | null: false  |

## Items テーブル

| Column             | Type       | Options            |
| ------------------ | ---------- | ------------------ |
| user               | references | foreign_key: true  |
| title              | string     | null: false        | 
| explan             | text       | null: false        | 
| category_id        | integer    | null: false        |
| condition_id       | integer    | null: false        |
| cost               | integer    | null: false        |
| shipping_id        | integer    | null: false        |
| region_id          | integer    | null: false        |
| delivery_date_id   | integer    | null: false        |

## Oders テーブル

| Column             | Type       | Options            |
| ------------------ | ---------- | ------------------ |
|user                | references | foreign_key: true  | 
|item_id             | references | foreign_key: true  | 
|seller_id           | references | foreign_key: true  |


## Sellers テーブル
| Column             | Type       | Options            |
| ------------------ | ---------- | ------------------ |
|oder_id             | references | foreign_key: true  |
|city                | string     | null: false        |
|address             | string     | null: false        |
|number              | string     | null: false        |
|another             | string     |                    |
|zip_code            | string     | null: false        |