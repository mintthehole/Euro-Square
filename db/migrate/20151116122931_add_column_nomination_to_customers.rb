class AddColumnNominationToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :nomination, :boolean
  end
end
