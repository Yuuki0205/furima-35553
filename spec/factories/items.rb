FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/sample.jpg'), filename: 'sample.jpg')
    end
    product_category_id { 2 }
    product_condition_id { 2 }
    shipping_charges_id { 2 }
    prefecture_id { 2 }
    days_ship_id { 2 }
    product_name { '商品の名前' }
    product_description { '商品の説明' }
    price { 500 }
    association :user
  end
end
