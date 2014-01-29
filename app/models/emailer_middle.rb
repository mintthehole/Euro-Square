class EmailerMiddle < ActiveRecord::Base
  belongs_to :emailer
  attr_accessible :left, :right, :order_no
end
