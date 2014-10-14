class BoReportsController < InheritedResources::Base
  def manage

  end
  def show
    @bo_report = BoReport.find_by_id(params[:id])
    params[:from_date] = Time.zone.today - 7.days if params[:from_date].blank?
    params[:to_date] = Time.zone.today if params[:to_date].blank?
    start = params[:from_date].to_datetime
    d_end =  params[:to_date].to_datetime
    if current_user.nomination?
      @bookings = Booking.where(:created_at => start..d_end.end_of_day, :is_nomination => true).paginate(:per_page => 100, :page => params[:page])
    else
      @bookings = Booking.where(:created_at => start..d_end.end_of_day, :is_nomination => false).paginate(:per_page => 100, :page => params[:page])
    end
    respond_to do |format|
      format.html {render :layout => 'application1'}
      format.json { render json: ReportDatatable.new(view_context) }
    end
  end


end
