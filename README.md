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
 has_many :order_details
 has_many :items

## itemsテーブル

| Column             | Type      | Options     |
| -------------------| --------- | ----------- |
|item_name           |string     |null:false   |
|description         |text       |null:false   |
|category_id         | integer   | null: false |
|situation_id        | integer   | null: false |
|delivery_charge_id  | integer   | null: false |
|prefectures_id      | integer   | null: false |
|delivery_days_id    | integer   | null: false |
|price               |integer    |null:false   |
|user                |references |null:false, foreign_key: true |

### Association
has_many :order_details, through: :orders
belongs_to :users



## ordersテーブル

| Column             | Type      | Options     |
| -------------------| --------- | ----------- |
|user                |references |null:false, foreign_key: true |
|item                |references |null:false, foreign_key: true |

### Association
belongs_to :items
belongs_to :order_details


## order_details

| Column             | Type      | Options     |
| -------------------| --------- | ----------- |
|order               |references |null:false, foreign_key: true |
|post_code           |string     |null:false   |
|prefectures_id      |string     |null:false   |
|municipalities      |string     |null:false   |
|street_address      |string     |null:false   |
|Building_name       |string     |             |
|telephone_number    |string     |null:false   |

### Association
has__many :items, through: :orders