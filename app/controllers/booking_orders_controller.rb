class BookingOrdersController < ApplicationController
	def index
		@booking_order = BookingOrder.first
	end

	def edit
		@booking_order = BookingOrder.first
	end

	def update
		@booking_order = BookingOrder.find_by_id(params[:id])
		p @booking_order
		@booking_order.update_attributes(params[:booking_order])
		p @booking_order.errors
		redirect_to booking_orders_path
	end

	def booking
		@booking_order = BookingOrder.first
		headers = @booking_order.get_header
		unless params[:id].blank?
			booking = Booking.find_by_id(params[:id])
		else
			booking = Booking.new
			booking.booking_order = @booking_order
		end
		changed = []
		booking.customer_name # need a fix
		headers.each_with_index do |head,i|
			if booking[head.name] != params[:values][i]
				changed << head.name
				booking[head.name] = params[:values][i] 
			end

		end
		p changed
  	Emailer.all.each do |emailer|
  		# field_name = Booking.first.magic_columns.where(:pretty_name => emailer.trigger_filed).first.name rescue ''
  		p emailer.trigger_filed
  		if changed.include?(emailer.trigger_filed)
  			emailer.send_email(booking)
  		end
  	end
		if booking.save
			render :text => 'true'
		else
			p booking.errors
			render :text => booking.errors
		end
	end
end
