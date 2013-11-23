class CreateBookingEmailers < ActiveRecord::Migration
  def change
    create_table :booking_emailers do |t|
      t.references :booking
      t.references :user
      t.references :emailer
      t.string :state

      t.timestamps
    end
    add_index :booking_emailers, :booking_id
    add_index :booking_emailers, :user_id
    add_index :booking_emailers, :emailer_id
  end
end
