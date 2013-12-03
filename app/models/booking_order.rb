class BookingOrder < ActiveRecord::Base
  has_many :bookings
  has_magic_columns
  accepts_nested_attributes_for :magic_columns, :allow_destroy => true

  def get_header(no = nil)
    if no
      magic_columns.order('id asc').limit(no)
    else
  	 magic_columns.order('id asc')
    end
  end

  def self.trigger_fields
  	headers = BookingOrder.first.get_header
  	# Emailer.pluck(:trigger_filed).each do ||
   #   end
  end
end
