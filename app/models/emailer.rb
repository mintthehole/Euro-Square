class Emailer < ActiveRecord::Base
  attr_accessible :bcc, :body, :cc, :footer, :header, :name, :stage, :subject,:email_tables_attributes,:emailer_horizontals_attributes,:trigger_filed
  has_many :email_tables
  has_many :emailer_horizontals
  validate :emailer_template
  attr_accessor :email_tables_attributes, :emailer_horizontals_attributes
  accepts_nested_attributes_for :email_tables, :emailer_horizontals
  

  def send_email(booking,user)
  	be = BookingEmailer.create(:booking_id => booking.id, :user_id => user.id,:emailer_id => self.id, :state => BookingEmailer::SEND_FOR_CONF )
  	EuroEximMailer.send_emailer(self,booking,user,be).deliver
  end


  def emailer_template
  	if self.subject.include? "%{"
  		start = self.subject.index('{').to_i ==  0 ? 0 : self.subject.index('{') + 1
  		a_end = self.subject.index('}').to_i ==  0 ? self.subject.count : self.subject.index('}') - 1
  		val = self.subject[start..a_end] rescue self.subject
  		if BookingOrder.first.magic_columns.where(:name => val).empty?
  			errors.add(:subject," : No Field named #{val} in booking order. Plz Correct ")
  		end
  	end
  end
end
