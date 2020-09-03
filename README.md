# テーブル設計

## users

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| family_name         | string  | null: false |
| first_name          | string  | null: false |
| family_name_reading | string  | null: false |
| first_name_reading  | string  | null: false |
| date_of_birth      | datetime | null: false |

### Association

- has_many :items
- has_many :orders


## items

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| item_category_id   | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| shipping_origin_id | integer    | null: false                    |
| shipping_period_id | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## addresses

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| telephone_number    | string     | null: false                    |
| order               | references | null: false, foreign_key: true |

### Association

- belongs_to :order


## orders

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address
