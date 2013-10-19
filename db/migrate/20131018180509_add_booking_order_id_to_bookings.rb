class AddBookingOrderIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :booking_order_id, :integer
  end
end
