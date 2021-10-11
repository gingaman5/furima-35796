class CreateShipAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_addresses do |t|

      t.string     :postcode,          null: false
      t.integer    :prefecture_id,     null: false
      t.string     :city,              null: false
      t.string     :block,             null: false
      t.string     :telephone_number,  null: false
      t.references :order,             null: false, foreign_key: true
      t.string     :building
      t.timestamps
    end
  end
end
