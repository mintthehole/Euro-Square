class HomeController < ApplicationController
	before_filter :authenticate_user!, :except => :index
  layout 'jbc'
	def index
		unless current_user
			redirect_to "/users/sign_in"
    else
      redirect_to "/jbc"
		end
	end
  def upload_epxorters

  end

  def report
  end

  def exporter_details
  	@exporters = Shipper.all
  end

  def exporter_export_details

  end

  def upload_path
  	if params[:upload_type] == Shipper::SELECT
	  	redirect_to "/upload_epxorters", :notice => "Please Select the Upload type"
	  elsif params[:attachment].blank?
	  	redirect_to "/upload_epxorters?upload_type=#{params[:upload_type]}", :notice => "Please Select the file to Upload"
	 	elsif File.extname(params[:attachment][:file].original_filename) != '.csv'
	 		redirect_to "/upload_epxorters?upload_type=#{params[:upload_type]}", :notice => "Please Upload a CSV File"
	  elsif params[:upload_type] == Shipper::EXPORTER
	  	total,no = Shipper.upload_shipper(params[:attachment][:file].tempfile)
	  	redirect_to "/upload_epxorters", :notice => "Sucessfully Uploaded, #{no} out of #{total}"
	  elsif params[:upload_type] == Shipper::EXPORTER_REPORT
	  	total,no = ShipperExportDetail.upload_shipper_export(params[:attachment][:file].tempfile)
	  	redirect_to "/upload_epxorters", :notice => "Sucessfully Uploaded"
	  end
  end

  def jbc
  	page_no = params[:page].blank? ? 1 : params[:page]
  	conditions = ['id is not null']
  	unless params[:name].blank?
  		conditions[0] << " and UPPER(name) like ?"
  		conditions << "%#{params[:name].upcase}%"
  	end
  	unless params[:email].blank?
  		conditions[0] << " and email = ?"
  		conditions << params[:email]
  	end
  	unless params[:state].blank?
  		conditions[0] << " and state = ?"
  		conditions << params[:state]
  	end
  	@orders = JbcOrders.paginate(:per_page => 15, :page => page_no, :conditions => conditions)
    @sum = JbcOrders.sum('number_of_copies')
  	render :jbc, :layout => 'jbc'
  end

  def jbc_csv
  end

  def update_country
  	order = JbcOrders.where(:id => params[:id]).first
  	order.country = params[:country]
  	order.city = params[:city]
  	order.save
  	redirect_to "/jbc?email=#{params[:email]}&name=#{params[:name]}&page=#{params[:page]}&state=#{params[:state]}"
  end

  def view_jbc_order
    @order = JbcOrders.where(:id => params[:id]).first
  	render :view_jbc_order, :layout => 'jbc'
  end

  def jbc_mailers
    render :jbc_mailers, :layout => 'jbc'
  end

  def send_jbc_mailer
    state = params[:state]
    orders = JbcOrders.where(:state => state, :country => params[:country])
    orders.each do |order|
      begin
        if state == JbcOrders::NEW
          JbcMailer.send_thank_mail_india(order).deliver
        else
          p "send other mailer"
        end
        order.state = JbcOrders::THANK
        order.save
      rescue Exception => e
        order.state = "#{state} Mail sending Failed"
      end
    end
    redirect_to '/jbc_mailers'
  end

  def close_jbc_order
    @order = JbcOrders.where(:id => params[:id]).first
    @order.state = JbcOrders::CLOSE
    @order.save
    redirect_to "/view_jbc_order?id=#{@order.id}",  :notice => "Order Sucessfully Closed"
  end

  def jbc_dvd_upload_path
  	total = 0
  	no = 0
  	total,no = JbcOrders.upload(params[:attachment][:file].tempfile)
  	redirect_to "/jbc", :notice => "Sucessfully Uploaded #{no} out of #{total}"
  end

  def delivery_options
    @cities = City.all
  end

  def new_option
    @city = City.first
  end

  def option_create
    @city = City.where(:id => params[:city]).first
    if @city
      redirect_to edit_city_path(@city)
    else
      redirect_to "/new_option"
    end
  end

end
