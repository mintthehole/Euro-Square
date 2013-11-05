class RemoveColumnFromSalesEntries < ActiveRecord::Migration
  def up
    remove_column :sales_call_entries, :mode
    remove_column :sales_call_entries, :pol
    remove_column :sales_call_entries, :pod
    remove_column :sales_call_entries, :cargo
    remove_column :sales_call_entries, :volume_idea
    remove_column :sales_call_entries, :rate_indication
    remove_column :sales_call_entries, :shipment_date
    remove_column :sales_call_entries, :possibility_to_secure
    remove_column :sales_call_entries, :competitor
    remove_column :sales_call_entries, :special_instruction
  end

  def down
  end
end
