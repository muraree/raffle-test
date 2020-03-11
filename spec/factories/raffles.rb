FactoryBot.define do
  factory :raffle do
    name { Faker::Lorem.sentence }
  end
end
