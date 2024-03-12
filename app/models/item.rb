class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day


  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :situation_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :delivery_charge_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :delivery_day_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :image, presence: true
  
end


