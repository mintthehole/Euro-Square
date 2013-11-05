class CreateSalesCallEnquiries < ActiveRecord::Migration
  def change
    create_table :sales_call_enquiries do |t|
      t.string :mode
      t.string :pol
      t.string :pod
      t.string :cargo
      t.string :volume_idea
      t.string :rate_indication
      t.date :shipment_date
      t.string :possibility_to_secure
      t.string :competitor
      t.string :special_instruction
      t.references :sales_call_entry
      t.references :user

      t.timestamps
    end
    add_index :sales_call_enquiries, :sales_call_entry_id
    add_index :sales_call_enquiries, :user_id
  end
end
