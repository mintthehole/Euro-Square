class CreateSalesCallEntries < ActiveRecord::Migration
  def change
    create_table :sales_call_entries do |t|
      t.date :date
      t.string :shipper_name
      t.text :pic
      t.text :point_discussed
      t.text :my_observation
      t.boolean :enquiry_recieved
      t.boolean :escalation
      t.integer :user_id
      t.timestamps
    end
  end
end
