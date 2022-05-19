FactoryBot.define do
  factory :order_delivery do
    postal_code     {"186-0013"}
    source_id       {2}
    city            {Faker::Address.city}
    address_line1   {Faker::Address.street_address}
    address_line2   {Faker::Address.secondary_address}
    number          {Faker::Number.leading_zero_number(digits: 10)}
  
    association :user
    association :item 
  end
end
