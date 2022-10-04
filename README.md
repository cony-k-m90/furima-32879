# テーブル設計

## usersテーブル
- deviseを使用する。

| Column              | Type   | Options                    |
| ------------------- | ------ | -------------------------- |
| nickname            | string | null: false                |
| email               | string | null: false, unique: true  |
| encrypted_password  | string | null: false                |
| last_name           | string | null: false                |
| first_name          | string | null: false                |
| last_name_kana      | string | null: false                |
| first_name_kana     | string | null: false                |
| birthday            | date   | null: false                |

### Association
- has_many :items
- has_many :orders


## itemsテーブル
- 定型的な項目を扱うカラムはアクティブハッシュを使用して実装する。(_idのカラム)

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| name                | string     | null: false                     |
| text                | text       | null: false                     |
| category_id         | integer    | null: false                     |
| condition_id        | integer    | null: false                     |
| delivery_charge_id  | integer    | null: false                     |
| shipping_area_id    | integer    | null: false                     |
| days_to_ship_id     | integer    | null: false                     |
| price               | integer    | null: false                     |
| user                | references | null: false, foreign_key: true  |

### Association
- belongs_to  :users
- has_one     :orders


## ordersテーブル

| Column    | Type       | Options                         |
| --------- | ---------- | ------------------------------- |
| user      | references | null: false, foreign_key: true  |
| item      | references | null: false, foreign_key: true  |

### Association
- belongs_to  :users
- belongs_to  :items
- has_one     :addresses


## addressesテーブル

| Column            | Type       | Options                         |
| ----------------- | ---------- | ------------------------------- |
| postal_code       | string     | null: false                     |
| shipping_area_id  | integer    | null: false                     |
| city              | string     | null: false                     |
| house_number      | string     | null: false                     |
| building_name     | string     |                                 |
| phone_number      | string     | null: false                     |
| order             | references | null: false, foreign_key: true  |

### Association
- belongs_to  :orders