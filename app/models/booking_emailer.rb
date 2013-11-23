class BookingEmailer < ActiveRecord::Base
  belongs_to :booking
  belongs_to :user
  belongs_to :emailer
  attr_accessible :state, :booking_id,:user_id,:emailer_id
  STATES = [
  	SEND_FOR_CONF = "Sent For Confirmation",
  	CONFIRMED = 'Confirmed'
  ]
end
