class CitiesController < ApplicationController
	layout 'jbc'
	def index

	end

  def edit
  	@city = City.where(:id => params[:id]).first
  end

  def update
  	@city = City.where(:id => params[:id]).first
  	if @city.update_attributes(params[:city])
  		redirect_to '/delivery_options', :notice => 'Sucesfully Added Option'
  	else
  		render :edit
  	end
  end
end
