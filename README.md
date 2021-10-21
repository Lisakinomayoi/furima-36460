# README

## users テーブル
| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true | 
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |
 
## Association
- has_many :items
- has_one :sending_information

## items テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | text       | null: false                    |
| name                | string     | null: false                    |
| info                | text       | null: false                    |
| category            | references | null: false, foreign_key: true |
| sales_status        | references | null: false, foreign_key: true |
| shipping_fee_status | references | null: false, foreign_key: true |
| prefecture          | references | null: false, foreign_key: true |
| scheduled_delivery  | date       | null: false,                   |
| price               | integer    | null: false                    |
| seller_id           | references | null: false, foreign_key: true |

### Association
- belongs_to :user 
- has_one :order

## sending_information テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ | 
| postal-code  | integer    | null: false                    |
| prefecture   | references | null: false, foreign_key: true |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone-number | integer    | null: false                    |

### Association
- belongs_to :order
- belongs_to :user

## orders テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| buyer_id | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :sending_information