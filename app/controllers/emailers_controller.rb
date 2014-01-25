class EmailersController < InheritedResources::Base
	before_filter :authenticate_user!

	def index
		@emailers = Emailer.order('stage asc')
	end
end
