class AddColumnToEmailerMiddles < ActiveRecord::Migration
  def change
    add_column :emailer_middles, :order_no, :integer
  end
end
