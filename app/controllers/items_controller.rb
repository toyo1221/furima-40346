class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_item, only: [:show, :edit, :update]

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
    @user = @item.user
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to root_path
    end
    @item.errors.clear
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :situation_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end