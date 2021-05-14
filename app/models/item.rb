class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :product_category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_ship
 
end
