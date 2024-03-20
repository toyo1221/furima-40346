class OrderForm
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, 
                :building_name, :telephone_number, :item_id, :user_id, :token

  def save
    order = Order.create(user_id:, item_id:)
    OrderDetail.create(post_code:, prefecture_id:, municipalities:, street_address:, building_name:, telephone_number:, order_id: order.id)
  end 

  with_options presence: true do 
    validates :token
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :street_address
    validates :building_name, allow_blank: true
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'only 10 or 11-digit half-width numeric input is allowed' }
    validates :item_id
    validates :user_id
  end
end