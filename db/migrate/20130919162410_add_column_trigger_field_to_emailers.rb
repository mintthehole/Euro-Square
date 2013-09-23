class AddColumnTriggerFieldToEmailers < ActiveRecord::Migration
  def change
    add_column :emailers, :trigger_filed, :string
  end
end
