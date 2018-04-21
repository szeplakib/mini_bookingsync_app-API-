FactoryBot.define do
  factory :rental do
    name { Faker::Company.name }
    daily_rate { Faker::Number.number(5) }
  end
end