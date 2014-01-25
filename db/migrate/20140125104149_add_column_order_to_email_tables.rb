class AddColumnOrderToEmailTables < ActiveRecord::Migration
  def change
    add_column :email_tables, :order, :integer
  end
end
