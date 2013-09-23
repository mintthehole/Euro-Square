class EmailTable < ActiveRecord::Base
  attr_accessible :emailer_id, :left, :right
  belongs_to :emailer

end
