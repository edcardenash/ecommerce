class PurchaseMailer < ApplicationMailer
  default from: 'notifications@ecommerce.com'

  def first_purchase_email(admins, product)
    @product = product
    mail(to: admins.map(&:email), subject: 'Se realizó la primera compra de un producto')
  end
end
