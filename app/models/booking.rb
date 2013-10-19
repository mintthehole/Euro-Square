class Booking < ActiveRecord::Base
	belongs_to :booking_order
	has_magic_columns :through => :booking_order
end
