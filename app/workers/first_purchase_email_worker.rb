class FirstPurchaseEmailWorker
  include Sidekiq::Worker

  def perform(product_id)
    product = Product.find(product_id)
    admins = Admin.all
    admins.each do |admin|
      PurchaseMailer.with(admin: admin, product: product).first_purchase_email.deliver_now
    end
  end
end
