class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :ship_charge
  belongs_to :prefecture
  belongs_to :ship_day

  validates :item_name, :item_description, :category_id, :item_condition_id, :ship_charge_id, :prefecture_id, :ship_day_id,
            :price, presence: true

  validates :category_id, :item_condition_id, :ship_charge_id, :prefecture_id, :ship_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
