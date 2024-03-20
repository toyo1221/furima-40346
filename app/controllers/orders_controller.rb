class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if @item.order.present? || current_user == @item.user
      redirect_to root_path
    else
      @order_form = OrderForm.new
    end
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid? 
      pay_item 
      @order_form.save 
      redirect_to root_path 
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end
  
  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def order_form_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :municipalities, :street_address, 
    :building_name, :telephone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :situation_id, :delivery_charge_id,
     :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_form_params[:token],   
      currency: 'jpy'             
    )
  end
end