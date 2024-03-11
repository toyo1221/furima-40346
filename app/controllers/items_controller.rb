class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

 private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :situation_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price, :image)
  end
end
