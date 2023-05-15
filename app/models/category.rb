class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  def top_products
    products.joins(:purchases)
            .group('products.id')
            .order('COUNT(purchases.id) DESC')
  end

  def top_revenue_products(limit = 3)
    products.joins(:purchases)
            .group('products.id')
            .order('SUM(purchases.total_price) DESC')
            .limit(limit)
  end
end
