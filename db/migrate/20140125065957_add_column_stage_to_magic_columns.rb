class AddColumnStageToMagicColumns < ActiveRecord::Migration
  def change
    add_column :magic_columns, :stage, :integer
  end
end
