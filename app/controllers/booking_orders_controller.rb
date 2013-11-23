class BookingOrdersController < ApplicationController
	before_filter :authenticate_user!
	def index
		@booking_order = BookingOrder.first
	end

	def edit
		@booking_order = BookingOrder.first
	end

	def update
		@booking_order = BookingOrder.find_by_id(params[:id])
		@booking_order.update_attributes(params[:booking_order])
		redirect_to booking_orders_path
	end

	def send_email_to_customer
		be = BookingEmailer.find_by_id(params[:id])
		if be && be.state == BookingEmailer::SEND_FOR_CONF
			EuroEximMailer.send_email_to_customer(be.booking,be.user,be.emailer)
			be.state = BookingEmailer::CONFIRMED
			be.save
			@msg = "Mail has been Sucessfully Sent"
		elsif be
			@msg = 'Emailer is Already sent'
		else
			@msg = 'No Emailer Found'
		end
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
		booking.user_id = current_user.id
		booking.email = Customer.find_by_name(booking.customer_name).try(:email)
		saved = booking.save
		if saved
			Emailer.all.each do |emailer|
				if changed.include?(emailer.trigger_filed)
					emailer.send_email(booking,current_user)
				end
			end
			render :text => 'true'
		else
			render :text => booking.errors
		end
	end
end
