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
| category            | integer    | null: false                    |
| status              | integer    | null: false                    |
| cost                | integer    | null: false                    |
| prefectures         | integer    | null: false                    |
| days                | integer    | null: false                    |
| user_id             | integer    | null: false, foreign_key: true | 


### Association

 belongs_to :user
 has_one :purchase
 belongs_to_active_hash :category
 belongs_to_active_hash :status
 belongs_to_active_hash :cost
 belongs_to_active_hash :prefectures
 belongs_to_active_hash :days


## Purchases テーブル
| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| product_id     | integer | null: false, foreign_key: true |
| user_id        | integer | null: false, foreign_key: true |
| destination_id | integer | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :product
belongs_to :destination

## destinations テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures      | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_id      | integer    | null: false, foreign_key: true |

### Association

has_one :purchase
has_one_active_hash :prefectures