# テーブル設計

## usersテーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birthday_year   | text   | null: false               |
| birthday_month  | text   | null: false               |
| birthday_day    | text   | null: false               |

### Association
- has_many :items
- has_many :purchase


## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | text       | null: false                    |
| item             | text       | null: false                    |
| text             | text       | null: false                    |
| category         | text       | null: false, foreign_key: true |
| condition        | text       | null: false, foreign_key: true |
| delivery_charge  | text       | null: false                    |
| shipping_area    | text       | null: false                    |
| days_to_ship     | text       | null: false                    |
| price            | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
| purchase         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase


## purchaseテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| address   | references | null: false, foreign_key: true |

### Association
- belongs_to  :user
- belongs_to  :item
- has_one     :address


## addressテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | integer    | null: false                    |
| todofuken_name  | string     | null: false                    |
| city_name       | text       | null: false                    |
| city_address    | text       | null: false                    |
| building_name   | text       | null: false                    |
| phone_number    | integer    | null: false                    |
| purchase_id     | references | null: false, foreign_key: true |

### Association
- belongs_to  :purchase