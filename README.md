# README

## users テーブル

| Column               | Type   | Options                   |
| --------             | ------ | -----------               |  
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| first_name           | string | null: false               |      
| last_name            | string | null: false               |       
| first_name_kana      | string | null: false               |
| last_name_kana       | string | null: false               |
| birth_date           | date   | null: false               |  


### Association

- has_many :items
- has_one  :purchase_history

# items テーブル

| Column              | Type          |  Options                        |
| --------            | ------        | -----------                     |
| product_name        | string        |  null: false                    |
| product_description | text          |  null: false                    | 
| product_category_id | integer       |  null: false                    |
| product_condition_id| integer       |  null: false                    |
| shipping_charges_id | integer       |  null: false                    |
| prefecture_id       | integer       |  null: false                    |
| days_ship_id        | integer       |  null: false                    |
| price               | integer       |  null: false                    |
| user                | references    |  null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_history




# address テーブル

| Column           | Type       | Options                         |
| --------         | ------     | -----------                     |
| postal_code      | string     |  null: false                    |
| prefecture_id    | integer    |  null: false                    |
| city             | string     |  null: false                    |
| address          | string     |  null: false                    |
| building_name    | string     |                                 |
| phone_number     | string     |  null: false                    |
| user             | references |  null: false, foreign_key: true |

 

### Association
belongs_to :purchase_history


# purchase_history テーブル

| Column           | Type       | Options                       |
| --------         | ------     | -----------                   |
| user             | references | null: false, foreign_key: true|
| item             | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address