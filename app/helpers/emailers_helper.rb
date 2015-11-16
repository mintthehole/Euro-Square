module EmailersHelper

	def build_agency
		options = {'-- Please Select -- ' => ''}
		Agency.order('name asc').each {|v| options = options.merge({v.name => v.name})}
		options
	end

	def build_customer(nomination,approved = false)
    options = {'-- Please Select -- ' => ''}
    if approved
    	Customer.where(:nomination =>nomination, :approved => approved).each {|v| options = options.merge({v.name => v.name})}
    else
    	Customer.where(:nomination =>nomination).order('name asc').each {|v| options = options.merge({v.name => v.name})}
    end
    options  
	end
end
