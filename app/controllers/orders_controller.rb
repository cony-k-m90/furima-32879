class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :move_to_index, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if @item.order.present?                   #自身の出品した商品購入ページに遷移しようとするとトップページに遷移する
      redirect_to root_path
    else
      if @item.user == current_user
        redirect_to root_path
      else
        @item_order = ItemOrder.new           #フォームオブジェクトに定義したItemOrderクラス
      end
    end
  end

  def create
    @item_order = ItemOrder.new(item_order_params)
      if @item_order.valid?
        pay_item
        @item_order.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def item_order_params
    # require: バリデーションで指定した値が存在しなければ例外を出す
    params.require(:item_order).permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: item_order_params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end