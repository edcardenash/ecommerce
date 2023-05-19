class Purchase < ApplicationRecord
  belongs_to :product
  belongs_to :client
  belongs_to :admin

  # Filters the purchases based on various parameters.
  def self.filter_by_params(params)
    query = self
    query = query.where("purchases.created_at >= ?", params[:start_date]) if params[:start_date].present?
    query = query.where("purchases.created_at <= ?", params[:end_date]) if params[:end_date].present?
    query = query.joins(product: :categories).where("categories.id = ?", params[:category_id]) if params[:category_id].present?
    query = query.where(client_id: params[:client_id]) if params[:client_id].present?
    query = query.joins(:product).where("products.admin_id = ?", params[:admin_id]) if params[:admin_id].present?
    query
  end

  # Sends an email to the admin when the first purchase of a product happens.
  after_create :check_first_purchase

  # Groups purchases by the time period specified by the granularity parameter and counts them. This can be used to get analytics data for displaying purchase trends.
  def self.count_by_granularity(params, granularity)
    group_by_clause = case granularity
                      when 'day'
                        "DATE_TRUNC('day', purchases.created_at)"
                      when 'week'
                        "DATE_TRUNC('week', purchases.created_at)"
                      when 'month'
                        "DATE_TRUNC('month', purchases.created_at)"
                      when 'year'
                        "DATE_TRUNC('year', purchases.created_at)"
                      else
                        return []
                      end

    purchases = filter_by_params(params)
    purchases.group(group_by_clause).count
  end

  private

  # Checks if this is the first purchase of the product and if so, queues an email to be sent.
  def check_first_purchase
    if product.purchases.count == 1
      FirstPurchaseEmailWorker.perform_async(self.product_id)
    end
  end
end
