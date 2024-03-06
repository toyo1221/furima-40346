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

## itemsテーブル

| Column             | Type      | Options     |
| -------------------| --------- | ----------- |
|item_name           |string     |null:false   |
|description         |text       |null:false   |
|category            |string     |null:false   |
|situation           |string     |null:false   |
|delivery_charge     |integer    |null:false   |
|shipping_source     |integer    |null:false   |
|delivery_days       |integer    |null:false   |
|price               |integer    |null:false   |
|user                |references |null:false, foreign_key: tru |

## ordersテーブル

| Column             | Type      | Options     |
| -------------------| --------- | ----------- |
|user                |references |null:false, foreign_key: tru |
|item                |references |null:false, foreign_key: tru |

## order_details

| Column             | Type      | Options     |
| -------------------| --------- | ----------- |
|order               |references |null:false, foreign_key: tru |
|item                |references |null:false, foreign_key: tru |
|quantity            |integer    |null:false   |
|order_price         |integer    |null:false   |
|post_code           |string     |null:false   |
|prefectures         |string     |null:false   |
|municipalities      |string     |null:false   |
|street_address      |string     |null:false   |
|Building_name       |string     |             |
|telephone_number    |string     |null:false   |