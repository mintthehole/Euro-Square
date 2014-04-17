class AddColumnDescriptionToBoReports < ActiveRecord::Migration
  def change
    add_column :bo_reports, :description, :text
  end
end
