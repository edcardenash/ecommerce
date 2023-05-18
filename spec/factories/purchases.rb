FactoryBot.define do
  factory :purchase do
    product
    client
    admin
    quantity { rand(1..10) }
    purchase_date { Date.today }
  end
end
