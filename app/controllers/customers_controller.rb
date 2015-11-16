class CustomersController < InheritedResources::Base
	before_filter :authenticate_user!
	def index
		if current_user.nomination?
			@tasks_grid = initialize_grid(Customer.where(nomination: true))
		else
			@tasks_grid = initialize_grid(Customer.where(nomination: false))
		end
	end
end
