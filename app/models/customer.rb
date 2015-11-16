class Customer < ActiveRecord::Base
  # attr_accessible :address_1, :address_2, :city, :contact_person, :email, :name, :phone, :zip_code
  validates :email, :presence => true
  validates :name, :presence => true
  validates :email, :uniqueness => true, :on => :create
  validates :name, :uniqueness => true, :on => :create
  
	require 'csv'
	UPLOAD_TYPES = [
		SELECT = "Select",
		EXPORTER = "Exporter",
		EXPORTER_REPORT = "Exporter Report"
	]

	validates :name, :presence => true
	def self.upload_customer(file,nomination)
		column_names = Customer.column_names
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
		  shipper = Customer.new(new_hash.symbolize_keys)
		  shipper.nomination = nomination
		  shippers = Customer.find(:all, :conditions => ["UPPER(name) like ?", "%#{shipper.name}%"])
		  if shippers.empty?
		  	if shipper.save
		  		saved += 1
		  	end
		  else
		  	saved += 1
		  end

		end
		return total , saved
	end
end
