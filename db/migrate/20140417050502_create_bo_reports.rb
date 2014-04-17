class CreateBoReports < ActiveRecord::Migration
  def change
    create_table :bo_reports do |t|
      t.string :name

      t.timestamps
    end
  end
end
