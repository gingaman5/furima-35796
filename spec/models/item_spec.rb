require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'item_name, item_description, category_id, item_condition_id, ship_charge_id, prefecture_id, ship_day_id, price, image,が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'item_nameが空では商品出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'imageが空では商品出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it 'item_descriptionが空では商品出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'category_idが空では商品出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1では商品出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'item_condition_idが空では商品出品できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'item_condition_idが1では商品出品できない' do
        @item.item_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'ship_charge_idが空では商品出品できない' do
        @item.ship_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship charge can't be blank")
      end
      it 'ship_charge_idが1では商品出品できない' do
        @item.ship_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship charge can't be blank")
      end
      it 'prefecture_idが空では商品出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1では商品出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'ship_day_idが空では商品出品できない' do
        @item.ship_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end
      it 'ship_day_idが1では商品出品できない' do
        @item.ship_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end
      it 'priceが空では商品出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが¥300~¥9,999,999の間でなければならない' do
        @item.price = '299'
        @item.valid?
         expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが¥300~¥9,999,999の間でなければならない' do
        @item.price = '10000000'
        @item.valid?
         expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数値のみでなければ商品出品できない' do
        @item.price = '２９９'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
