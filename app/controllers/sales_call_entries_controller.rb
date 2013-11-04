class SalesCallEntriesController < InheritedResources::Base
	before_filter :authenticate_user!

	def index
		@sales_call_entries = current_user.sales_call_entries.order('id desc')
	end

	def create
		@sales_call_entry = SalesCallEntry.new(params[:sales_call_entry])
		 if @sales_call_entry.save
		 	redirect_to sales_call_entries_path
		 else
		 	render :action => 'new'
		 end

	end
end
