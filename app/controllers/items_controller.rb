class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

 private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :situation_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
