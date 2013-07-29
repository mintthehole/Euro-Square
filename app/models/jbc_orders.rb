class JbcOrders < ActiveRecord::Base
	require 'csv'
  attr_accessible :addres, :city, :country, :email, :name, :number_of_copies, :order_date, :phone_number, :state, :updated_by, :amount
  validates :email, :presence => true
  validates :email, :uniqueness => true, :on => :create
  after_save :send_mail
	STATES = [
		NEW = 'New',
		THANK = "Thanks Mail & Ac Details Sent",
		COST = 'Cost Details Sent',
		RELEASED = "Release Notification",
		PAYMENT = "Payment Recieved",
		DISPATCH = 'Dispatched',
		CLOSE = "Closed"
	]	

	def amount_recived?
		state == PAYMENT
	end

	def send_mail
		if self.state == PAYMENT
			JbcMailer.send_payment_mailer(self).deliver
		elsif self.state == DISPATCH
			JbcMailer.send_dispatch_mailser(self).deliver
		end
	end

	def self.upload(file)
		columns = JbcOrders.column_names
		column_names = columns.delete_if {|x| ["id","created_at","updated_at"].include?(x) }
		# csv_text = File.read(Rails.public_path+'/jbc.csv')
		csv_text = File.read(file)
		csv = CSV.parse(csv_text, :headers => true)
		total = csv.count
		saved = 0
		csv.each do |row|
		  row = row.to_hash.with_indifferent_access
	    hash = {}
	    row.to_hash.each_pair do |k,v|
	      hash[k.downcase] = v 
	    end
	    new_hash = {}
		  column_names.each do |cn|
		  	new_hash[cn] = hash[cn]
		  end
		  order = JbcOrders.new(new_hash.symbolize_keys)
		  order.state = NEW if order.state.blank?
		  order.updated_by = 'System' if order.updated_by.blank?
	  	if order.save
	  		saved += 1
	  	end
		end
		return total , saved
	end
	
	def self.get_city_count(city)
		JbcOrders.count(:all, :conditions => ['city = ? ',city])
	end

	def self.get_count(state)
		JbcOrders.count(:all, :conditions => ['state = ? ',state])
	end
end

