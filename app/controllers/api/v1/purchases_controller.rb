module Api
  module V1
    class PurchasesController < BaseController
      before_action :set_purchase, only: [:show, :update, :destroy]

      # Returns a list of purchases.
      def index
        # It uses caching with a dynamic cache key to store different results for different query parameters.
        cache_key = "purchases/#{params.permit!.to_query}"
        purchases = Rails.cache.fetch(cache_key, expires_in: 1.hour) do
          Purchase.filter_by_params(params)
        end
        render json: purchases
      end

      # Returns a list of purchases grouped by a specified granularity (e.g., day, month, year).
      def purchases_by_granularity
        granularity = params[:granularity] || 'day'
        # Similarly, it uses caching to store the results.
        purchases_count = Rails.cache.fetch("purchases_by_granularity/#{granularity}", expires_in: 1.hour) do
          Purchase.count_by_granularity(params, granularity)
        end

        result = purchases_count.map do |date, count|
          {
            date: date.strftime('%Y-%m-%d %H:%M'),
            count: count
          }
        end

        render json: result
      end

      private

      def set_purchase
        @purchase = Purchase.find(params[:id])
      end

      def purchase_params
        params.require(:purchase).permit(:product_id, :client_id, :quantity)
      end
    end
  end
end
