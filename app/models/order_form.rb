class OrderForm
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, 
                :building_name, :telephone_number, :item_id, :user_id
  #  後で↑token 足す

  def save
    order = Order.create(user_id:, item_id:)
    OrderDetail.create(post_code:, prefecture_id:, municipalities:, street_address:, building_name:, telephone_number:, order_id: order.id)
  end 
  #  後で↑token 足す

  with_options presence: true do 
    # validates :token
    validates :post_code
    validates :prefecture_id
    validates :municipalities
    validates :street_address
    validates :building_name
    validates :telephone_number
    validates :item_id
    validates :user_id
  end
end