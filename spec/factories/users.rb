FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { SecureRandom.alphanumeric(6) }
    password_confirmation { password }
    first_name            { '漢字' }  
    last_name             { '漢字' }  
    kana_first_name       { 'カタカナ' }  
    kana_last_name        { 'カタカナ' }  
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) } 
  end
end