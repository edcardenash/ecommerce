FactoryBot.define do
  factory :category do
    name { Faker::Vehicle.make_and_model }
  end
end
