FactoryBot.define do
  factory :item do
    item_name     {Faker::Lorem.word}
    describe      {Faker::Lorem.sentence}
    category_id   {2}
    status_id     {2}
    fee_id        {2}
    source_id     {2}
    duration_id   {2}
    price         {Faker::Number.number(digits: 4)}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
