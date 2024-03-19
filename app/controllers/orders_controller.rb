class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item 

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid? 
      @order_form.save 
      redirect_to root_path 
    else
      render :index, status: :unprocessable_entity
    end
  end
  
  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def order_form_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :municipalities, :street_address, 
    :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :situation_id, :delivery_charge_id,
     :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end

  