class AddColumnModeToSalesCallEntries < ActiveRecord::Migration
  def change
    add_column :sales_call_entries, :mode, :string
    add_column :sales_call_entries, :pol, :string
    add_column :sales_call_entries, :pod, :string
    add_column :sales_call_entries, :cargo, :string
    add_column :sales_call_entries, :volume_idea, :string
    add_column :sales_call_entries, :rate_indication, :string
    add_column :sales_call_entries, :shipment_date, :date
    add_column :sales_call_entries, :possibility_to_secure, :string
    add_column :sales_call_entries, :competitor, :string
    add_column :sales_call_entries, :special_instruction, :string
  end
end
