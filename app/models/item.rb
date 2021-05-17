class Item < ApplicationRecord
  with_options presence: true do
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :product_category_id
      validates :product_condition_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :days_ship_id
    end

    validates :product_name, length: { maximum: 40 }
    validates :product_description, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
  end

  belongs_to :user
  # has_one    :purchase_history
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :product_category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_ship
end
