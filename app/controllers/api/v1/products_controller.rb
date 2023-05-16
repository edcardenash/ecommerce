module Api
  module V1
    class ProductsController < BaseController
      before_action :set_product, only: [:show, :update, :destroy]

      def top_products
        top_products_per_category = Rails.cache.fetch("top_products_per_category", expires_in: 1.hour) do
          Category.includes(:top_products).map do |category|
            {
              category_name: category.name,
              top_product: category.top_products.first
            }
          end
        end

        render json: top_products_per_category
      end

      def top_revenue_products
        top_revenue_products_per_category = Rails.cache.fetch("top_revenue_products_per_category", expires_in: 1.hour) do
          Category.includes(:top_revenue_products).map do |category|
            {
              category_name: category.name,
              top_revenue_products: category.top_revenue_products(3)
            }
          end
        end

        render json: top_revenue_products_per_category
      end

      private

      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :description, :price, :admin_id)
      end
    end
  end
end
