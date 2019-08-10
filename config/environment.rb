# Load the Rails application.
require_relative 'application'

ActionMailer::Base.smtp_settings = {
:user_name => ENV['SENDGRID_USER'],
  :password => ENV['SENDGRID_PASS'],
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

# Initialize the Rails application.
Rails.application.initialize!
