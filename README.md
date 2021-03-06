# テーブル設計

  ## usersテーブル

  |Column|           |Type  |Options|
  |------|           |------|------------|
  |name              |string|null: false |
  |email             |string|null: false, unique: true|
  |encrypted_password|string|null: false |
  |last_name|        |string|null: false|
  |first_name|       |string|null: false|
  |last_name_kana|   |string|null: false|
  |first_name_kana|  |string|null: false|
  |birthday|         |date  |null: false|

  ### Association

- has_many :items
- has_many :orders

  ## itemsテーブル

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

  ### Association

  - belongs_to :user
  - has_one :order


  ## ordersテーブル

  |Column| |Type      |Options|
  |------| |----------|-------|
  |user  | |references|null: false, foreign_key: true|
  |item  | |references|null: false, foreign_key: true|

  ### Association

  - belongs_to :user
  - belongs_to :item
  - has_one :ship_address

  ## ship_addressesテーブル

  |Column          |Type      |Options|
  |----------------|----------|-------|
  |order|          |references|null: false, foreign_key: true|
  |postcode|       |string    |null: false|
  |prefecture_id|  |integer   |null: false|
  |city|           |string    |null: false|
  |block|          |string    |null: false|
  |building|       |string    |------------|
  |telephone_number|string    |null: false|

  ### Association

  - belongs_to :order