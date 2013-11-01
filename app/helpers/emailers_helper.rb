module EmailersHelper
	def build_customer
    options = {'-- Please Select -- ' => ''}
    Shipper.all.each {|v| options = options.merge({v.name => v.name})}
    options  
	end
end
