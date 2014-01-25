class EmailTable < ActiveRecord::Base
  attr_accessible :emailer_id, :left, :right, :order_no
  belongs_to :emailer
  validate :emailer_template

  def emailer_template
  	if self.right.include? "%{"
  		start = self.right.index('{').to_i ==  0 ? 0 : self.right.index('{') + 1
  		a_end = self.right.index('}').to_i ==  0 ? self.right.count : self.right.index('}') - 1
  		val = self.right[start..a_end] rescue self.right
  		if BookingOrder.first.magic_columns.where(:name => val).empty?
  			errors.add(:right, "No Field named #{val} in booking order. Plz Correct ")
  		end
  	end
  	if self.left.include? "%{"
  		start = self.left.index('{').to_i ==  0 ? 0 : self.left.index('{') + 1
  		a_end = self.left.index('}').to_i ==  0 ? self.left.count : self.left.index('}') - 1
  		val = self.left[start..a_end] rescue self.left
  		if BookingOrder.first.magic_columns.where(:name => val).empty?
  			errors.add(:left,"No Field named #{val} in booking order. Plz Correc ")
  		end
  	end
  end
end
