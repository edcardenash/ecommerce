FactoryBot.define do
  factory :product do
    name { Faker::Vehicle.make_and_model }
    description { Faker::Vehicle.standard_specs.join(', ') }
    price { Faker::Commerce.price(range: 20_000.0..80_000.0) }
    admin
  end
end
