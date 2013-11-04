class EuroEximMailer < ActionMailer::Base
  add_template_helper(ApplicationHelper)
  default :from => 'johnpollo88@gmail.com'
  default :reply_to => 'johnpollo88@gmail.com'
  default :template_path => 'mailers'

	def send_emailer(emailer,booking)
		@emailer = emailer
		@booking = booking
		mail(:to => 'johnpollo88@gmail.com', :subject => @emailer.subject,
        :cc => 'js@euroeximindia.com')
	end

	def send_sales_escalation_email(sales_entry)
		@sales_entry = sales_entry
		mail(:to => 'johnpollo88@gmail.com', :subject =>"Escaltion of Sales Entry by #{@sales_entry.user.email}",
        :cc => 'js@euroeximindia.com')

	end
end