class City < ActiveRecord::Base
  attr_accessible :name, :options_attributes
  has_many :options
  attr_accessor :options_attributes
  accepts_nested_attributes_for :options, :allow_destroy => true
end
