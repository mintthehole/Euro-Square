class Option < ActiveRecord::Base
  attr_accessible :address, :name, :city_id
  belongs_to :city
  validates :name, :presence => true
  validates :address, :presence => true
end
