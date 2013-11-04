ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "system.euroexim@gmail.com",
  :password             => "Victorpol1",
  :authentication       => "plain",
  :enable_starttls_auto => true
}


ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
