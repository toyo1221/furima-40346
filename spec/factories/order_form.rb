FactoryBot.define do
  factory :order_form do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    prefecture_id { 1 }
    municipalities { '東京都' }
    street_address { '1-1-1' }
    building_name { 'マンションA' }
    telephone_number { '09012345678' }
    user
    item
  end
end