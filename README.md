# テーブル設計

## usersテーブル

| Column              | Type   | Options                    |
| ------------------- | ------ | -------------------------- |
| nickname            | string | null: false                |
| email               | string | null: false, unique: true  |
| encrypted_password  | string | null: false                |
| last_name           | string | null: false                |
| first_name          | string | null: false                |
| last_name_kana      | string | null: false                |
| first_name_kana     | string | null: false                |
| birthday_year       | date   | null: false                |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| item             | string     | null: false                     |
| text             | text       | null: false                     |
| category         | string     | null: false                     |
| condition        | string     | null: false                     |
| delivery_charge  | string     | null: false                     |
| shipping_area    | string     | null: false                     |
| days_to_ship     | string     | null: false                     |
| price            | string     | null: false                     |
| user             | references | null: false, foreign_key: true  |

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

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| postal_code     | string     | null: false                     |
| todofuken_id    | string     | null: false                     |
| city_name       | string     | null: false                     |
| city_address    | string     | null: false                     |
| building_name   | string     |                                 |
| phone_number    | string     | null: false                     |
| purchase        | references | null: false, foreign_key: true  |

### Association
- belongs_to  :purchase