FactoryBot.define do
  factory :booking do
    start_at "2018-04-18 22:30:31"
    end_at "2018-04-20 22:30:31"
    client_email { Faker::Internet.email }
    price 20
  end
end