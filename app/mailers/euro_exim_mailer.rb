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
		mail(:to => ['selvamj@euroeximindia.com','crm@euroeximindia.com','ns@euroeximindia.com'], :subject =>"Escaltion of Sales Entry by #{@sales_entry.user.name} a/c #{@sales_entry.shipper_name}")
	end

	def send_sales_enquiry_email(sales_enquiry)
		@sales_enquiry = sales_enquiry
		mail(:to => ['selvamj@euroeximindia.com','crm@euroeximindia.com','ns@euroeximindia.com'], :subject =>"Sales Enquiry by #{@sales_enquiry.user.name} a/c #{@sales_enquiry.shipper_name}",:cc =>'johnpollo88@gmail.com')
	end
end