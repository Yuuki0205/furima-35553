# README

## users テーブル

| Column               | Type   | Options     |
| --------             | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| password_confirmation| string | null: false |
| first_name           | string | null: false |      
| last_name            | string | null: false |       
| first_name_kana      | string | null: false |
| last_name_kana       | string | null: false |
| birth_date           | date   | null: false |  


### Association

- has_many :items
- has_many :address
- has_one  :purchase_history

# items テーブル

| Column              | Type          |  Options                        |
| --------            | ------        | -----------                     |
| product_name        | text          |  null: false                    |
| product_description | text          |  null: false                    | 
| product_category    | string        |  null: false                    |
| product_condition   | string        |  null: false                    |
| shipping_charges    | string        |  null: false                    |
| shipping_area       | string        |  null: false                    |
| days_ship           | string        |  null: false                    |
| price               | integer       |  null: false                    |
| user                | references    |  null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :address
- has_one    :purchase_history




# address テーブル

| Column           | Type       | Options                         |
| --------         | ------     | -----------                     |
| postal_code      | integer    |  null: false                    |
| prefecture       | string     |  null: false                    |
| city             | string     |  null: false                    |
| address          | string     |  null: false                    |
| building_name    | string     |                                 |
| phone_number     | integer    |  null: false                    |
| user             | references |  null: false, foreign_key: true |

 

### Association

- belongs_to :user
- belongs_to :item


# purchase_history テーブル

| Column           | Type       | Options                       |
| --------         | ------     | -----------                   |
| user             | references | null: false, foreign_key: true|
| item             | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item