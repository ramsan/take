# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Demo::Application.initialize!



ActionMailer::Base.smtp_settings = {
                          :address   => "smtp.sendgrid.net",
                           :port      => 587,
                           :domain    => "yourdomain.com",
                           :user_name => "mybusinessapp",
                           :password  => "4emc912",
                           :authentication => 'plain',
                           :enable_starttls_auto => true 
}
