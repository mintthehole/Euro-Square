class AddColumnIsNominationToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :is_nomination, :boolean, :default => false
  end
end
