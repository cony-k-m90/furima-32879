class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in?
      unless @item.user == current_user
        redirect_to action: :index
      end
    else
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id,
                                 :delivery_charge_id, :shipping_area_id, :days_to_ship_id, :price, :item_image).merge(user_id: current_user.id)
  end
end
