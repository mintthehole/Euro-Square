class SalesCallEntriesController < InheritedResources::Base
	before_filter :authenticate_user!

	def index
		@sales_call_entries = current_user.sales_call_entries.order('id desc')
	end

	def create
		@sales_call_entry = SalesCallEntry.new(params[:sales_call_entry])
		 if @sales_call_entry.save
		 	if @sales_call_entry.enquiry_recieved
		 		p params[:sales_call_entry][:sales_call_entires]
		 		SalesCallEnquiry.create(params[:sales_call_entry][:sales_call_entires].merge(:shipper_name => @sales_call_entry.shipper_name, :pic => @sales_call_entry.pic,		 		
																																:date => @sales_call_entry.date, :user_id => current_user.id, :sales_call_entry_id => @sales_call_entry.id))
		 	end
		 	redirect_to sales_call_entries_path
		 else
		 	render :action => 'new'
		 end

	end
end
