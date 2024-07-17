# テーブル設計

## users テーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | --------------------------- |
| email              | string | null: false, unique: turue  |
| encrypted_password | string | null: false                 |
| nick_name          | string | null: false                 |
| birth_date         | date   | null: false                 |
| last_name          | string | null: false                 |
| first_name         | string | null: false                 |
| last_name_kana     | string | null: false                 |
| first_name_kana    | string | null: false                 |

### Association
- has_many :items
- has_many :orders

## Items テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | --------------------------------|
| user               | references | null: false, foreign_key: true  |
| title              | string     | null: false                     | 
| explan             | text       | null: false                     | 
| category_id        | integer    | null: false                     |
| condition_id       | integer    | null: false                     |
| shipping_cost_id   | integer    | null: false                     |
| region_id          | integer    | null: false                     |
| delivery_date_id   | integer    | null: false                     |
| cost               | integer    | null: false                     |

### Association
- belongs_to :user
- has_one :order

## Order テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
|user                | references | null: false, foreign_key: true  | 
|item                | references | null: false, foreign_key: true  | 

### Association
- belongs_to :user
- belongs_to :item
- has_one :seller


## Seller テーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| order              | references | null: false, foreign_key: true  |
| zip_code           | string     | null: false                     |
| region_id          | integer    | null: false                     |
| city               | string     | null: false                     |
| address            | string     | null: false                     |
| another            | string     |                                 |
| phone_number       | string     | null: false                     |

### Association
- belongs_to :order