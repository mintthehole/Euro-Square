class SalesCallEntry < ActiveRecord::Base
  # attr_accessible :date, :enquiry_recieved, :escalation, :my_observation, :pic, :point_discussed, :shipper_name, :user_id

  validates :my_observation, :presence => true
  validates :pic, :presence => true
  validates :point_discussed, :presence => true
  validates :shipper_name, :presence => true
  attr_accessor :sales_call_entires
  after_create :send_email
  belongs_to :user
  has_one :sales_call_enquiry
  scope :user, order('user_id')
  def send_email
  	if escalation && !enquiry_recieved
  		EuroEximMailer.send_sales_escalation_email(self).deliver
  	end
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
