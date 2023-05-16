# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Action Mailer
Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 465,
    user_name: 'edcarhor.dev@gmail.com',
    password: 'Testing1605!!',
    authentication: :plain,
    enable_starttls_auto: true
  }
end
