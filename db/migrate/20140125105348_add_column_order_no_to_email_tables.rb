class AddColumnOrderNoToEmailTables < ActiveRecord::Migration
  def change
    add_column :email_tables, :order_no, :integer
  end
end
