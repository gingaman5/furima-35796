# テーブル設計

  ## usersテーブル

  |Column|           |Type|Options|
  |------|           |------|------------|
  |name              |string|null: false |
  |email             |string|null: false, unique: true|
  |encrypted_password|string|null: false |

  ### Association

- has_many :item
- has_many :order

  ## itemsテーブル

  |Column|           |Type|Options|
  |------|           |------|------------|
  |image|             |string|null: false |
  |item_name|         |string|null: false|
  |item_description|  |text  |null: false|
| |category|          |text  |null: false|
  |item_condition|    |text  |null: false|
  |ship_charge|       |integer|null: false|
  |ship_area|           |string|null: false|
  |ship_day|            |date|null: false|
  |price|               |integer|null: false|
  |user|                |references|null: false, foreign_key: true|

  ### Association

  - belongs_to user
  - has_one :order


  ## ordersテーブル

  |Column| |Type|Options|
  |------| |----------|------------|
  |user  | |references|null: false, foreign_key: true|
  |item  | |references|null: false, foreign_key: true|

  ### Association

  - belongs_to user
  - belongs_to item
  - has_many :ship_addresses

  ## ship_addressesテーブル

  |Column| |Type|Options|
  |------| |----------|------------|
  |order|      |references|null: false, foreign_key: true|
  |postcode|   |string|null: false|
  |prefecture| |string|null: false|
  |city|       |string|null: false|
  |block|      |string|null: false|
  |building|   |string|------------|
  |telephone_number|string|null: false|

  ### Association

  - belongs_to order