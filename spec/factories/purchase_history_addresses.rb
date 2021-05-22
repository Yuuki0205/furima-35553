FactoryBot.define do
  factory :purchase_history_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { ' 住所 ' }
    phone_number { '09012345678' }
    building_name { 'ビル' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
