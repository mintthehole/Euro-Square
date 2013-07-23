class JbcOrders < ActiveRecord::Base
	require 'csv'
  attr_accessible :addres, :city, :country, :email, :name, :number_of_copies, :order_date, :phone_number, :state, :updated_by
  validates :email, :presence => true
  validates :email, :uniqueness => true, :on => :create
	STATES = [
		NEW = 'New',
		THANK = "Thanks Mail & Ac Details Sent",
		RELEASED = "Release Notification",
		PAYMENT = "Payment Recieved",
		DISPATCH = 'Dispatched',
		CLOSE = "Closed"
	]	

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
		  order.state = NEW
		  order.updated_by = 'System'
	  	if order.save
	  		saved += 1
	  	end
		end
		return total , saved
	end

	def self.get_count(state)
		JbcOrders.count(:all, :conditions => ['state = ? ',state])
	end
end

