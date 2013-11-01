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
		headers.each_with_index do |head,i|
			booking[head.name] = params[:values][i]
		end
		if booking.save
			render :text => 'true'
		else
			p booking.errors
			render :text => booking.errors
		end
	end
end
