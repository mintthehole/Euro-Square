class CustomersController < InheritedResources::Base
	before_filter :authenticate_user!
	def index
		@tasks_grid = initialize_grid(Customer)
	end
end
