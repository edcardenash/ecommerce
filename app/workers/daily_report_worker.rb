class DailyReportWorker
  include Sidekiq::Worker

  # This worker method generates a daily report of purchases and emails it to all admins.
  def perform
    yesterday_purchases = Purchase.where(created_at: 1.day.ago.all_day)
    report = generate_report(yesterday_purchases)
    admins = Admin.all
    admins.each do |admin|
      ReportMailer.with(admin: admin, report: report).daily_report_email.deliver_now
    end
  end

  private

  # This helper method generates a textual report of purchases.
  def generate_report(purchases)
    purchases.map do |purchase|
      "Producto: #{purchase.product.name}, Cliente: #{purchase.client.name}, Cantidad: #{purchase.quantity}, Fecha: #{purchase.created_at}"
    end.join("\n")
  end
end
