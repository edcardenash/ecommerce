class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  # Returns the top products in the category based on the number of purchases.
  def top_products
    products.joins(:purchases)
            .group('products.id')
            .order('COUNT(purchases.id) DESC')
  end

  # Returns the top products in the category based on the total revenue generated.
  def top_revenue_products(limit = 3)
    products.joins(:purchases)
            .select('products.*, SUM(products.price * purchases.quantity) as revenue')
            .group('products.id')
            .order('revenue DESC')
            .limit(limit)
  end
end
