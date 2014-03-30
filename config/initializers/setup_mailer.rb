ActionMailer::Base.smtp_settings = {
  :address              => "smtp.rediffmailpro.com",
  :port                 => 587,
  :domain               => "rediffmailpro.com",
  :user_name            => "system@euroeximindia.com",
  :password             => "15111980",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
