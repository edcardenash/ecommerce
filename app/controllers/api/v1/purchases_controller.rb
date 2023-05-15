module Api
  module V1
    class PurchasesController < BaseController
      before_action :set_purchase, only: [:show, :update, :destroy]
      def index
        purchases = Purchase.filter_by_params(params)
        render json: purchases
      end

      def purchases_by_granularity
        granularity = params[:granularity] || 'day'
        purchases_count = Purchase.count_by_granularity(params, granularity)

        result = purchases_count.map do |purchase|
          {
            date: purchase.date.strftime('%Y-%m-%d %H:%M'),
            count: purchase.count
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
