class SalesCallEnquiry < ActiveRecord::Base
  belongs_to :sales_call_entry
  belongs_to :user
  after_create :send_email
  # attr_accessible :cargo, :competitor, :mode, :pod, :pol, :possibility_to_secure, :rate_indication, :shipment_date, :special_instruction, :volume_idea
  MODES = ["LCL Export","LCL Import","FCL Export","FCL Import","Air Export","Air Import"]

  def send_email
    EuroEximMailer.delay.send_sales_enquiry_email(self)
    # Delayed::Job.enqueue SalesCallEnquiryEmailJob.new(self.id)
  end

  before_save :convert_date

  def convert_date
    self.date = self.date.to_date
  end

  def self.get_column_names
  	d = ['id','created_at','updated_at','user_id']
  	a = self.column_names
  	d.each do |d1|
  		a.delete(d1)
  	end
  	a
  end
end
