class Purchase < ApplicationRecord
  belongs_to :product
  belongs_to :client
  belongs_to :admin

  def self.filter_by_params(params)
    query = self
    query = query.where("purchases.created_at >= ?", params[:start_date]) if params[:start_date].present?
    query = query.where("purchases.created_at <= ?", params[:end_date]) if params[:end_date].present?
    query = query.joins(:product).where("products.category_id = ?", params[:category_id]) if params[:category_id].present?
    query = query.where(client_id: params[:client_id]) if params[:client_id].present?
    query = query.joins(:product).where("products.admin_id = ?", params[:admin_id]) if params[:admin_id].present?
    query
  end
end
