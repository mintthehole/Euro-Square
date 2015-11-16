class AddColumnAgencyIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :agency_id, :integer
  end
end
