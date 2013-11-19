class SalesCallEnquiriesController < InheritedResources::Base
	before_filter :authenticate_user!
	def index
		@sales_call_enquiries = current_user.sales_call_enquiries.order('id desc').paginate(:per_page => 20, :page => params[:page])
	end
end
