# README

# mercari DB設計
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|seller_id|integer|null: false foreigh_key: true|
|name|string|null: false|
|gender|string|null: false|
|brand|string|null: false|
|size|integer|null: false|
|condition|integer|null: false|
|postage|integer|null: false|
|shipping|string|null: false|
|area|string|null: false|
|day_before_shippment|string|null: false|
|price|integer|null: false|
|comments|text|null: false|
|like|string|null: false|

### Association
- belongs_to user
- has_many likes
- has_many comments
- belongs_to sell
- belongs_to buy
- belongs_to history
- belongs_to category
- has_many photos

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_kana|stirng|null: false|
|first_kana|string|null: false|
|birth_year|integer|null: false|
|birth_momth|integer|null: false|
|birth_day|integer|null: false|
|phone_number|integer|null: false|
|code|integer|null: false|
|prefectures|text|null: false|
|municipalities|text|null: false|
|adress|integer|null: false|
|building|string|null: false|
|tel_number|string||
|icon_img|text||
|background-img|text||
|history_id|integer|null:false, foreign_key:true|
|seller_id|integer||
|profile|text||

### Association
- has_many items
- has_many evaluations
- has_many comments
- has_many sells
- has_many buys
- has_many historys


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|string|null: false|
|image_1|string||
|image_2|string||
|image_3|string||
|image_4|string||
|image_5|string||
|image_6|string||
|image_7|string||
|image_8|string||
|image_9|string||
|image_10|string||

### Association
- belongs_to item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreign_key:true|
|seller_id|string|null: false, foreign_key:true|
|comment|text|null: false, foreign_key:true|

### Association
- belongs_to item
- belongs_to user

## sellersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreign_key:true|
|item_id|string|null: false, foreign_key:true|

### Association
- belongs_to user
- belongs_to item

## likes テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null:false, foreign_key:true|
|item_id|string|null:false, foreign_key:true|

### Association
- belongs_to item

## evalutions テーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|integer|null:false, foreign_key:true|
|user_id|integer|null:false, foreign_key:true|
|good|integer||
|nomal|integer||
|bad|integer||
|comment|text||

### Association
- belongs_to user
- belongs_to seller

## sells テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key:true|
|item_id|integer|null:false, foreign_key:true|

### Association
- belongs_to user
- belongs_to item


## buys テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key:true|
|item_id|integer|null:false, foreign_key:true|
|status|string|null:false|

### Association
- belongs_to user
- belongs_to item


## historys テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key:true|
|item_id|integer|null:false, foreign_key:true|

belongs_to user
belongs_to item

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
