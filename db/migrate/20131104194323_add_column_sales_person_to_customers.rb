class AddColumnSalesPersonToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :sales_person, :string
  end
end
