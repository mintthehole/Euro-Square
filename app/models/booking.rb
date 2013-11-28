class Booking < ActiveRecord::Base
	belongs_to :booking_order
	belongs_to :user
	belongs_to :customer
	has_magic_columns :through => :booking_order
	has_many :booking_emailers
	validates :customer_id, :presence => true
	
	def build_hash_for_mailer(emailer)
		self.customer_name #fix me
		headers = booking_order.get_header.collect(&:name)
		hash = {}
		headers.each do |header|
			hash[header.to_sym] = self[header]
		end
		hash[:user_name] = user.name
		hash[:customer_name] = self.customer.contact_person
		hash[:subject] = emailer.subject
		hash
	end

end
