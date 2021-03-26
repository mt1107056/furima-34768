# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| read_family        | string | null: false               |
| read_first         | string | null: false               |
| birth              | date   | null: false               | 

### Association

 has_many :products
 has_many :purchases
 has_one :destination

## products テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| price               | integer    | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| cost_id             | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| day_id              | integer    | null: false                    |
| user_id             | integer    | null: false, foreign_key: true | 


### Association

 belongs_to :user
 has_one :purchase
 belongs_to_active_hash :category
 belongs_to_active_hash :status
 belongs_to_active_hash :cost
 belongs_to_active_hash :prefecture
 belongs_to_active_hash :days


## Purchases テーブル
| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| product_id     | integer | null: false, foreign_key: true |
| user_id        | integer | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :product
has_one :destination

## destinations テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_id      | integer    | null: false, foreign_key: true |

### Association

belongs_to :purchase
has_one_active_hash :prefecture