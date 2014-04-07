class CreateBookingReports < ActiveRecord::Migration
  def change
    create_table :booking_reports do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
