class CreateBoReportFields < ActiveRecord::Migration
  def change
    create_table :bo_report_fields do |t|
      t.references :bo_report
      t.references :magic_column

      t.timestamps
    end
    add_index :bo_report_fields, :bo_report_id
    add_index :bo_report_fields, :magic_column_id
  end
end
