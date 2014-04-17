class BoReportsController < InheritedResources::Base
  def manage

  end
  def show
    @bo_report = BoReport.find_by_id(params[:id])
    respond_to do |format|
      format.html {render :layout => 'application1'}
      format.json { render json: ReportDatatable.new(view_context) }
    end
  end


end
