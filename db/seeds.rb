require 'faker'

categories = ["Sedán", "Deportivo", "SUV", "Pickup", "Hatchback"]
categories.each do |category_name|
  Category.create!(name: category_name)
end

Category.all.each do |category|
  15.times do
    product = Product.create!(
      name: Faker::Vehicle.make_and_model,
      description: Faker::Vehicle.standard_specs.join(', '),
      price: Faker::Commerce.price(range: 20_000.0..80_000.0, as_string: true),
      admin: Admin.first # Asegúrate de tener al menos un Admin creado antes de ejecutar este seed
    )
    ProductCategory.create!(product: product, category: category)
  end
end

5.times do
  Admin.create!(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

20.times do
  Client.create!(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end
