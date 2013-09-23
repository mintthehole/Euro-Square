class EuroEximMailer < ActionMailer::Base
  add_template_helper(ApplicationHelper)
  default :from => 'johnpollo88@gmail.com'
  default :reply_to => 'johnpollo88@gmail.com'
  default :template_path => 'mailers'

	def send_emailer(emailer)
		@emailer =emailer
		mail(:to => '12@13.com', :subject => @emailer.subject,
        :cc => @emailer.cc)
	end
end