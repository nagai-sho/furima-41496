# README

## users Table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| last_name          | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name         | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | integer | null: false               |

### Association

- has_many :orders
- has_many :items
- has_many :comments
- has_many :favorites

## orders Table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| municipality     | string     | null: false                    |
| house_number     | integer    | null: false, unique: true      |
| building         | string     |                                |
| phone_number     | integer    | null: false, unique: true      |
| customer_user_id | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## items Table

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| product                 | string     | null: false                    |
| price                   | integer    | null: false                    |
| explain                 | text       | null: false                    |
| category                | string     | null: false                    |
| condition               | string     | null: false                    |
| shipping_fee            | integer    | null: false                    |
| prefecture              | string     | null: false                    |
| required_number_of_days | integer    | null: false                    |
| seller_user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order
- belongs_to :image
- has_many :comments
- has_many :favorites

## favorites Table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| favorite | string     | null: false                    |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## comments Table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## Active Storage

| Column | Type | Options     |
| ------ | ---- | ----------- |
| image  | text | null: false |

### Association

- belongs_to :item
