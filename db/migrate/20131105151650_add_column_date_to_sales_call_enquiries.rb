class AddColumnDateToSalesCallEnquiries < ActiveRecord::Migration
  def change
    add_column :sales_call_enquiries, :date, :date
    add_column :sales_call_enquiries, :shipper_name, :string
    add_column :sales_call_enquiries, :pic, :string
  end
end
