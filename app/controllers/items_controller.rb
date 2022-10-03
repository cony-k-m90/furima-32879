class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to action: :index if @item.order.present? || @item.user != current_user
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.user == current_user
    if @item.destroy
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id,
                                 :delivery_charge_id, :shipping_area_id, :days_to_ship_id, :price, :item_image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
