 class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.bcc} #{message.subject}"
    message.to = ["selvameuroexim@gmail.com", "joeleuroexim@gmail.com"]
    message.cc =""
    message.bcc = ""
  end
end