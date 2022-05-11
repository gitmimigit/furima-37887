# README

##  users

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_kana         | string | null: false               |
| last_kana          | string | null: false               |
| birth_year_id      | integer| null: false               |
| birth_month_id     | integer| null: false               |
| birth_day_id       | integer| null: false               |

### Association

- has_many :items
- has_many :orders
- belongs_to :birth_year
- belongs_to :birth_month
- belongs_to :birth_day

##  items

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| image          | string     | null: false                    |
| item_name      | string     | null: false                    |
| describe       | text       | null: false                    |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| fee_id         | integer    | null: false                    |
| source-id      | integer    | null: false                    |
| days-id        | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_one :delivery

##  orders

| Column         | Type      | Options                                   |
| -------------- | --------- | ----------------------------------------- |
| item           | references| null: false, foreign_key: true            |
| user           | references| null: false, foreign_key: true            |
|                |           |                                           |


### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

##  deliveries

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address_line1      | string     | null: false                    |
| address_kine2      | string     | null: false                    |
| number             | integer    | null: false                    |
| order              | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :order
- belongs_to :prefecture
