class BookingsController < ApplicationController
  before_filter :authenticate_user!
  # active_scaffold :booking do |conf|
  # end

  def new
  	@booking_order = BookingOrder.first
  	@booking = Booking.new
  	@booking.booking_order = @booking_order
  end

  def edit
  	@booking_order = BookingOrder.first
  	@booking = Booking.find_by_id(params[:id])
  	@booking.booking_order = @booking_order
  end
  
  def show
  	@booking = Booking.find_by_id(params[:id])
  end

  def create
  	@booking_order = BookingOrder.first
  	headers = @booking_order.get_header
  	@booking = Booking.new()
  	@booking.booking_order = @booking_order
  	changed = []
  	@booking.customer_name # need a fix

  	headers.each_with_index do |head,i|
  		if @booking[head.name] != params[:booking][head.name]
  			changed << head.name
  			@booking[head.name] = params[:booking][head.name] 
  		end
  	end
  	@booking.user_id = current_user.id
    cus = Customer.find_by_name(@booking.customer_name)
  	@booking.email = cus.try(:email)
    @booking.customer_id = cus.try(:id)
  	saved = @booking.save
  	if saved
  		Emailer.all.each do |emailer|
  			if changed.include?(emailer.trigger_filed)
  				emailer.send_email(@booking,current_user)
  			end
  		end
  		redirect_to @booking
  	else
  		render :new
  	end
  end

  def update
  	@booking_order = BookingOrder.first
  	headers = @booking_order.get_header
  	@booking = Booking.find_by_id(params[:id])
  	@booking.booking_order = @booking_order
  	changed = []
  	@booking.customer_name # need a fix

  	headers.each_with_index do |head,i|
  		if @booking[head.name] != params[:booking][head.name]
  			changed << head.name
  			@booking[head.name] = params[:booking][head.name] 
  		end
  	end
  	@booking.user_id = current_user.id
  	@booking.email = Customer.find_by_name(@booking.customer_name).try(:email)
  	saved = @booking.save
  	if saved
  		Emailer.all.each do |emailer|
  			if changed.include?(emailer.trigger_filed)
  				emailer.send_email(@booking,current_user)
  			end
  		end
  		redirect_to @booking
  	else
  		render :edit
  	end
  end
end 