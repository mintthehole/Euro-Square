class SalesCallEntriesController < InheritedResources::Base
	before_filter :authenticate_user!

	def index
		@sales_call_entries = current_user.sales_call_entries
	end
end
