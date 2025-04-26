# README

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

# テーブル設計

## usersテーブル

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|sei               |string|null: false              |
|mei               |string|null: false              |
|sei_kana          |string|null: false              |
|mei_kana          |string|null: false              |
|birthday          |date  |null: false              |

### Association

- has_many :items 
- has_many :histories

## itemsテーブル

|Column           |Type      |Options                       |
|-----------------|----------|------------------------------|
|title            |string    |null: false                   |
|description      |text      |null: false                   |
|item_category_id |integer   |null: false                   |
|item_condition_id|integer   |null: false                   |
|delivery_fee_id  |integer   |null: false                   |
|prefecture_id    |integer   |null: false                   |
|delivery_day_id  |integer   |null: false                   |
|price            |integer   |null: false                   |
|user             |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :history

## addressesテーブル

|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|zipcode      |string    |null: false                   |
|prefecture_id|integer   |null: false                   |
|city         |string    |null: false                   |
|street       |string    |null: false                   |
|building     |string    |                              |
|phone_number |string    |null: false                   |
|history      |references|null: false, foreign_key: true|

### Association

- belongs_to :history

## historiesテーブル

|Column      |Type      |Options                       |
|------------|----------|------------------------------|
|user        |references|null: false, foreign_key: true|
|item        |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address