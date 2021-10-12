require 'rails_helper'

RSpec.describe ShipAddress, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
end
