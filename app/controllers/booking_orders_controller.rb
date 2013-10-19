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
		booking = Booking.new
		booking.booking_order = @booking_order
		booking.save
		booking.reload
		headers.each_with_index do |head,i|
			p head.name
			booking[head.name] = params[:values][i]
		end
		p booking
		if booking.save
			render :text => 'true'
		else
			p booking.errors
			p ppp
		end
	end
end
