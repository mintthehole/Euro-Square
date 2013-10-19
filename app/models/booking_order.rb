class BookingOrder < ActiveRecord::Base
  has_many :bookings
  has_magic_columns
  accepts_nested_attributes_for :magic_columns, :allow_destroy => true

  def get_header
  	magic_columns.order('id asc')
  end
end
