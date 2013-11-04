class AddColumnNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :user_role, :string
  end
end
