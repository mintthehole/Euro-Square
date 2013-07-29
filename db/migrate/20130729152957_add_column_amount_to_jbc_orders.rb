class AddColumnAmountToJbcOrders < ActiveRecord::Migration
  def change
    add_column :jbc_orders, :amount, :float
  end
end
