class OrderShipAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :telephone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :prefecture_id, :city, :block, :item_id, :user_id, :token
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    ShipAddress.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building,
                       telephone_number: telephone_number, order_id: order.id)
  end
end
