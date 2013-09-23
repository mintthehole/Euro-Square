class Emailer < ActiveRecord::Base
  attr_accessible :bcc, :body, :cc, :footer, :header, :name, :stage, :subject,:email_tables_attributes,:emailer_horizontals_attributes
  has_many :email_tables
  has_many :emailer_horizontals
  attr_accessor :email_tables_attributes, :emailer_horizontals_attributes
  accepts_nested_attributes_for :email_tables, :emailer_horizontals
end
