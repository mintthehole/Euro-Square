class Emailer < ActiveRecord::Base
  attr_accessible :bcc, :body, :cc, :footer, :header, :name, :stage, :subject,:email_tables_attributes,:emailer_horizontals_attributes,:trigger_filed
  has_many :email_tables
  has_many :emailer_horizontals
  attr_accessor :email_tables_attributes, :emailer_horizontals_attributes
  accepts_nested_attributes_for :email_tables, :emailer_horizontals

  def send_email(booking)
  	p booking
  	EuroEximMailer.send_emailer(self,booking).deliver
  end
end
