class BookingEmailer < ActiveRecord::Base
  belongs_to :booking
  belongs_to :user
  belongs_to :emailer
  attr_accessible :state, :booking_id,:user_id,:emailer_id
  STATES = [
  	SEND_FOR_CONF = "Sent For Confirmation",
  	CONFIRMED = 'Confirmed'
  ]
  after_save :update_booking

  def update_booking
  	if state == CONFIRMED
  		booking.state = emailer.name
  		booking.save
  	end
  end
end
