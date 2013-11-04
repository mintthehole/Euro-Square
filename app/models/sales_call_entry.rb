class SalesCallEntry < ActiveRecord::Base
  # attr_accessible :date, :enquiry_recieved, :escalation, :my_observation, :pic, :point_discussed, :shipper_name, :user_id

  validates :my_observation, :presence => true
  validates :pic, :presence => true
  validates :point_discussed, :presence => true
  validates :shipper_name, :presence => true

  after_create :send_email
  belongs_to :user
  MODE = ["LCL Export","LCL Import","FCL Export","FCL Import","Air Export","Air Import"]
  def send_email
  	if escalation || enquiry_recieved
  		EuroEximMailer.send_sales_escalation_email(self).deliver
  	end
  end

end
