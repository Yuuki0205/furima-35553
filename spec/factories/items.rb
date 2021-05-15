FactoryBot.define do
  factory :item do
    image
    product_category_id
    product_condition_id
    shipping_charges_id
    prefecture_id
    days_ship_id
    product_name
    product_description
    price
  end
end
