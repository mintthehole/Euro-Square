module EmailersHelper
	def build_customer(approved = false)
    options = {'-- Please Select -- ' => ''}
    if approved
    	Customer.find_all_by_approved(true).each {|v| options = options.merge({v.name => v.name})}
    else
    	Customer.order('name asc').each {|v| options = options.merge({v.name => v.name})}
    end
    options  
	end
end
