FactoryBot.define do
  factory :booking do
    star_at "2018-04-18 22:30:31"
    end_at "2018-04-18 22:30:31"
    client_email { Faker::Internet.email }
    daily_rate { Faker::Number.number(5) }
  end
end