class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new           #フォームオブジェクトに定義したItemOrderクラス
  end

  def create
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
        @item_order.save
        redirect_to action: :index
      else
        render action: :index
      end
  end

  private

  def item_order_params
    # require: バリデーションで指定した値が存在しなければ例外を出す
    params.require(:item_order).permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end