class BoReportField < ActiveRecord::Base
  belongs_to :bo_report
  belongs_to :magic_column
  attr_accessible :bo_report_id, :magic_column_id
  validates_presence_of :magic_column_id
end
