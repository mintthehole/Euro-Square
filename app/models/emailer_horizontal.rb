class EmailerHorizontal < ActiveRecord::Base
  belongs_to :emailer
  attr_accessible :bottom, :top
  validate :emailer_template

  def emailer_template
  	if self.bottom.include? "%{"
  		start = self.bottom.index('{').to_i ==  0 ? 0 : self.bottom.index('{') + 1
  		a_end = self.bottom.index('}').to_i ==  0 ? self.bottom.count : self.bottom.index('}') - 1
  		p start
  		p a_end
  		val = self.bottom[start..a_end] rescue self.bottom
  		p val
  		if BookingOrder.first.magic_columns.where(:name => val).empty?
  			errors.add(:bottom, " : No Field named #{val} in booking order. Plz Correct ")
  		end
  	end
  	if self.top.include? "%{"
  		start = self.top.index('{').to_i ==  0 ? 0 : self.top.index('{') + 1
  		a_end = self.top.index('}').to_i ==  0 ? self.top.count : self.top.index('}') - 1
  		val = self.top[start..a_end] rescue self.top
  		if BookingOrder.first.magic_columns.where(:name => val).empty?
  			errors.add(:top," : No Field named #{val} in booking order. Plz Correc ")
  		end
  	end
  end
end
