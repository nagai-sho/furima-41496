# README

## users Table

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :orders
- has_many :items

## orders Table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses Table

| Column       | Type    | Options                   |
| ------------ | ------- | ------------------------- |
| post_code    | string  | null: false               |
| prefecture   | string  | null: false               |
| municipality | string  | null: false               |
| house_number | string  | null: false               |
| building     | string  |                           |
| phone_number | integer | null: false, unique: true |

### Association

- belongs_to :order

## items Table

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| product                    | string     | null: false                    |
| price                      | integer    | null: false                    |
| explain                    | text       | null: false                    |
| category_id                | string     | null: false                    |
| condition_id               | string     | null: false                    |
| shipping_fee_id            | integer    | null: false                    |
| prefecture_id              | string     | null: false                    |
| required_number_of_days_id | integer    | null: false                    |
| user_id                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
