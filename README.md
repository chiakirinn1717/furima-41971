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
- has_one :address

## itemsテーブル

|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|title         |string    |null: false                   |
|description   |string    |null: false                   |
|item_category |string    |null: false                   |
|item_condition|string    |null: false                   |
|delivery_fee  |string    |null: false                   |
|delivery_area |string    |null: false                   |
|delivery_days |string    |null: false                   |
|price         |int       |null: false                   |
|charge        |int       |null: false                   |
|profit        |int       |null: false                   |
|user_id       |references|null: false, foreign_key: true|
|history_id    |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :history

## addressesテーブル

|Column      |Type      |Options                       |
|------------|----------|------------------------------|
|zipcode     |string    |null: false                   |
|prefecture  |string    |null: false                   |
|city        |string    |null: false                   |
|street      |string    |null: false                   |
|building    |string    |null: false                   |
|phone_number|int       |null: false                   |
|user_id     |references|null: false, foreign_key: true|

### Association

- belongs_to :user

## historiesテーブル

|Column      |Type      |Options                       |
|------------|----------|------------------------------|
|user_id     |string    |null: false, foreign_key: true|
|item_id     |string    |null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item