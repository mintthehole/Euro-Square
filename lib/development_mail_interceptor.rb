 class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.bcc} #{message.subject}"
    message.to = ["johnpollo88@gmail.com"]
    message.cc =""
    message.bcc = ""
  end
end