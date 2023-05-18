FactoryBot.define do
  factory :client do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
