class JbcMailer < ActionMailer::Base
  default :from => 'jbc@jbcword.com'
  default :reply_to => 'jbc@jbcword.com'
  default :template_path => 'mailers'
  def send_thank_mail_india(order)
  	@order = order
  	mail.attachments['BankDetails.pdf'] = File.read(Rails.public_path+'/bank_1.pdf')
    mail(:to => order.try(:email), :subject => 'LOVE, SEX & MARRIAGE',
        :cc => 'orders@jbcword.com')
  end
end
