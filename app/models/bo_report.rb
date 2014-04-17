class BoReport < ActiveRecord::Base
  has_many :bo_report_fields
  accepts_nested_attributes_for :bo_report_fields
  validates_presence_of :name
end
