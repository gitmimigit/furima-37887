FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 2)}
    first_name            {"テスト"}
    last_name             {"テスト"}
    first_kana            {"テスト"}
    last_kana             {"テスト"}
    birth_date            {Faker::Date.in_date_period}
  end
end
