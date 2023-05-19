require 'faker'

# This block of code generates fake data for testing. Faker is used to generate realistic data.

# Create categories of products
categories = ["Sedán", "Deportivo", "SUV", "Pickup", "Hatchback"]
categories.each do |category_name|
  Category.create!(name: category_name)
end

# Create 5 admin users
5.times do
  Admin.create!(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

# Create 15 products in each category
Category.all.each do |category|
  15.times do
    product = Product.create!(
      name: Faker::Vehicle.make_and_model,
      description: Faker::Vehicle.standard_specs.join(', '),
      price: Faker::Commerce.price(range: 20_000.0..80_000.0, as_string: true),
      admin: Admin.first
    )
    ProductCategory.create!(product: product, category: category)
  end
end

# Create 20 client users
20.times do
  Client.create!(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end
