class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :business_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
