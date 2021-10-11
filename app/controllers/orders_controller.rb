class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :on_item, only: [:index, :create]
  before_action :move_to_root, only: [:index]

  def index
    @order = OrderShipAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderShipAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_ship_address).permit(:postcode, :prefecture_id, :city, :block, :building, :telephone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp.api_key = 'sk_test_fd311af00bd7efa3a334e1de'
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def on_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    redirect_to root_path if current_user == @item.user || @item.order.present?
  end
end
