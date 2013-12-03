class AddColumnStateMsgToEmailers < ActiveRecord::Migration
  def change
    add_column :emailers, :state_msg, :string
  end
end
