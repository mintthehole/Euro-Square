class SalesCallEnquiryEmailJob < Struct.new(:id)

  def perform
  	sce = SalesCallEnquiry.find_by_id(id)
		EuroEximMailer.send_sales_enquiry_email(sce).deliver
  end

end