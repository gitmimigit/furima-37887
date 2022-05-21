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
| birth_date         | date   | null: false               |


### Association

- has_many :items
- has_many :orders


##  items

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_name      | string     | null: false                    |
| describe       | text       | null: false                    |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| fee_id         | integer    | null: false                    |
| source_id      | integer    | null: false                    |
| duration_id    | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

##  orders

| Column         | Type      | Options                                   |
| -------------- | --------- | ----------------------------------------- |
| item           | references| null: false, foreign_key: true            |
| user           | references| null: false, foreign_key: true            |


### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

##  deliveries

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| source_id          | integer    | null: false                    |
| city               | string     | null: false                    |
| address_line1      | string     | null: false                    |
| address_line2      | string     |                                |
| number             | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order
