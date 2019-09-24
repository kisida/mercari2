# README

# mercari DB設計
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:true, foreign_key: true|
|seller_id|references|null: false, foreign_key:true|
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
|status|int|null: false|

### Association
- belongs_to user
- has_many likes,dependent: :destroy
- has_many comments,dependent: :destroy
- belongs_to category
- has_many item_images,dependent: :destroy

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|address_id|references|null: false, foreign_key:true|
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
|icon_img|text|
|background-img|text||
|profile|text||

### Association
- has_many items,dependent: :destroy
- has_many evaluations,dependent: :destroy
- has_many comments,dependent: :destroy
- ham_many addresses,dependent: :destroy
- has_many likes,dependent: :destroy

## category テーブル
|Column|Type|Options|
|------|----|-------|
|parent_id|string|null: false|
|name|string|null: false|
|item_id|references|null: false, foreign_key:true|

### Association
- has_many items
- has_anscestory


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|code|integer|null: false|
|prefectures|text|null: false|
|municipalities|text|null: false|
|adress|integer|null: false|
|building|string||
|tel_number|string||

### Association
belongs_to user


## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|
|item_id|references|null:false, foreign_key:true|
|comment|text|null: false|

### Association
- belongs_to item
- belongs_to user


## likes テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|item_id|references|null:false, foreign_key:true|

### Association
- belongs_to item

## evalutions テーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|references|null:false, foreign_key:true|
|user_id|references|null:false, foreign_key:true|
|smile|integer|null: false|
|comment|text||

### Association
- belongs_to user
- belongs_to seller


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