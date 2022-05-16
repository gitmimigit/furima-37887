FactoryBot.define do
  factory :item do
    item_name     {Faker::Lorem.word}
    describe      {Faker::Lorem.sentence}
    category_id   {1}
    status_id     {1}
    fee_id        {1}
    source_id     {1}
    duration_id   {1}
    price         {Faker::Number.number(digits: 4)}
    association :user 
  end
end
