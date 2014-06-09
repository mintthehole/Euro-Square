class BoReportsController < InheritedResources::Base
  def manage

  end
  def show
    @bo_report = BoReport.find_by_id(params[:id])
    params[:from_date] = Time.zone.today - 7.days if params[:from_date].blank?
    params[:to_date] = Time.zone.today if params[:to_date].blank?
    conditions = ["id is not null"]
    conditions[0] << " AND created_at between date(?) and date(?)"
    conditions << params[:from_date].to_date
    conditions << params[:to_date].to_date
    @bookings = Booking.find(:all)#, :conditions => conditions)
    # p @bookings
    # p ppp
    respond_to do |format|
      format.html {render :layout => 'application1'}
      format.json { render json: ReportDatatable.new(view_context) }
    end
  end


end
