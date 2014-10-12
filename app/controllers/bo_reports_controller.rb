class BoReportsController < InheritedResources::Base
  def manage

  end
  def show
    @bo_report = BoReport.find_by_id(params[:id])
    params[:from_date] = Time.zone.today - 7.days if params[:from_date].blank?
    params[:to_date] = Time.zone.today if params[:to_date].blank?
    start = params[:from_date].to_datetime
    d_end =  (params[:to_date] + 1.day).to_datetime
    @bookings = Booking.where(:created_at => start..d_end).paginate(:per_page => 100, :page => params[:page])
    respond_to do |format|
      format.html {render :layout => 'application1'}
      format.json { render json: ReportDatatable.new(view_context) }
    end
  end


end
