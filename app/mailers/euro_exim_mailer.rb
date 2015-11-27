class EuroEximMailer < ActionMailer::Base
  add_template_helper(ApplicationHelper)
  default :from => 'system@euroeximindia.com'
  default :reply_to => 'system@euroeximindia.com'
  default :template_path => 'mailers'

	def send_emailer(be)
		@emailer = be.emailer
		@booking = be.booking
		@be = be
		user = be.user
		@hash =  @booking.build_hash_for_mailer(@emailer)

		to_ids = [user.email]
		cc_ids = ["js@euroeximindia.com"]

		if user.nomination?
			to_ids << "followup2@euroeximindia.com" #Nomination followup
		else
			to_ids << "followup1@euroeximindia.com" #Free-hands followup
		end

		mail(:to => to_ids, :subject => @emailer.subject % @hash, :cc => cc_ids)
	end

	def send_email_to_customer(booking,user,emailer)
		@emailer = emailer
		@booking = booking
		@hash =  @booking.build_hash_for_mailer(@emailer)
		mail(:to => booking.email, :subject => @emailer.subject % @hash,
				 :cc => @emailer.cc,
	      :bcc => ['js@euroeximindia.com','hr@euroeximindia.com',user.email]) #Adding HR id in BCC for now
	end

	def send_email_to_agency(booking,user,emailer)
		@emailer = emailer
		@booking = booking
		@hash =  @booking.build_hash_for_mailer(@emailer)
		mail(:to => bookingtry(:agency).try(:email), :subject => @emailer.subject % @hash,
				 :cc => @emailer.cc,
	      :bcc => ['js@euroeximindia.com','hr@euroeximindia.com',user.email]) #Adding HR id in BCC for now
	end

	def send_sales_escalation_email(sales_entry)
		@sales_entry = sales_entry
		mail(:to => ['selvamj@euroeximindia.com','ns@euroeximindia.com'], :subject =>"Escaltion of Sales Entry by #{@sales_entry.user.name} a/c #{@sales_entry.shipper_name}")
	end

	def send_sales_enquiry_email(sales_enquiry)
		@sales_enquiry = sales_enquiry
		mail(:to => ['selvamj@euroeximindia.com','ns@euroeximindia.com','bdm1@euroeximindia.com','cs1@euroeximindia.com','cs2@euroeximindia.com'], :subject =>"Sales Enquiry by #{@sales_enquiry.user.name} a/c #{@sales_enquiry.shipper_name}")
	end
end