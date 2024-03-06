# FURIMAのER図

## usersテーブル

| Column             | Type      | Options     |
| -------------------| --------- | ----------- |
|nickname            |string     |null:false   |
|email               |string     |null:false, unique: true |
|encrypted_password  |string     |null:false   |
|first_name          |string     |null:false   |
|last_name           |string     |null:false   |
|kana_first_name     |string     |null:false   |
|kana_last_name      |string     |null:false   |
|birthday            |date       |null:false   |

### Association
 has_many :orders
 has_many :items

## itemsテーブル

| Column             | Type      | Options     |
| -------------------| --------- | ----------- |
|item_name           |string     |null:false   |
|description         |text       |null:false   |
|category_id         | integer   | null: false |
|situation_id        | integer   | null: false |
|delivery_charge_id  | integer   | null: false |
|prefecture_id      | integer   | null: false |
|delivery_day_id    | integer   | null: false |
|price               |integer    |null:false   |
|user                |references |null:false, foreign_key: true |

### Association
has_one :orders
belongs_to :user



## ordersテーブル

| Column             | Type      | Options     |
| -------------------| --------- | ----------- |
|user                |references |null:false, foreign_key: true |
|item                |references |null:false, foreign_key: true |

### Association
belongs_to :item
has_one :order_detail
belongs_to :user


## order_details

| Column             | Type      | Options     |
| -------------------| --------- | ----------- |
|order               |references |null:false, foreign_key: true |
|post_code           |string     |null:false   |
|prefecture_id      |string     |null:false   |
|municipalities      |string     |null:false   |
|street_address      |string     |null:false   |
|Building_name       |string     |             |
|telephone_number    |string     |null:false   |

### Association
has__one :order