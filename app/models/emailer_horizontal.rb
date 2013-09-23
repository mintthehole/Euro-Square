class EmailerHorizontal < ActiveRecord::Base
  belongs_to :emailer
  attr_accessible :bottom, :top
end
