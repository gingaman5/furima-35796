# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

  |Column|            |Type|Options|
  |------|            |------|------------|
  |item_name|         |string|null: false|
  |item_description|  |text  |null: false|
  |category_id|       |integer|null: false|
  |item_condition_id| |integer|null: false|
  |ship_charge_id|    |integer|null: false|
  |prefecture_id|     |integer|null: false|
  |ship_day_id|       |integer|null: false|
  |price|             |integer|null: false|
  |user|              |references|null: false, foreign_key: true|


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
