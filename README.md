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
- has_many :purchases


## itemsテーブル
- 定型的な項目を扱うカラムはアクティブハッシュを使用して実装する。(_idのカラム)

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| item                | string     | null: false                     |
| text                | text       | null: false                     |
| category_id         | integer    | null: false                     |
| condition_id        | integer    | null: false                     |
| delivery_charge_id  | integer    | null: false                     |
| shipping_area_id    | integer    | null: false                     |
| days_to_ship_id     | integer    | null: false                     |
| price               | integer    | null: false                     |
| user                | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one    :purchase


## purchasesテーブル

| Column    | Type       | Options                         |
| --------- | ---------- | ------------------------------- |
| user      | references | null: false, foreign_key: true  |
| item      | references | null: false, foreign_key: true  |

### Association
- belongs_to  :user
- belongs_to  :item


## addressesテーブル

| Column            | Type       | Options                         |
| ----------------- | ---------- | ------------------------------- |
| postal_code       | string     | null: false                     |
| shipping_area_id  | string     | null: false                     |
| city_name         | string     | null: false                     |
| city_address      | string     | null: false                     |
| building_name     | string     |                                 |
| phone_number      | string     | null: false                     |
| purchase          | references | null: false, foreign_key: true  |

### Association
- belongs_to  :purchase