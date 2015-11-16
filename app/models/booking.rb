class Booking < ActiveRecord::Base
	belongs_to :booking_order
	belongs_to :user
	belongs_to :customer
	belongs_to :agency
	has_magic_columns :through => :booking_order
	has_many :booking_emailers
	validates :customer_id, :presence => true
	before_create :set_defaults

	def set_defaults
		self.state = 'New'
	end

	def build_hash_for_mailer(emailer)
		self.customer_name #fix me
		headers = booking_order.get_header.collect(&:name)
		hash = {}
		headers.each do |header|
			hash[header.to_sym] = self[header]
		end
		hash[:user_name] = user.name
		hash[:customer_name] = self.customer.name
		hash[:subject] = emailer.subject
		hash[:pic] =  self.customer.contact_person
		hash
	end

	def get_emailers
		booking_emailers.joins(:emailer).order('emailers.stage desc')
	end
end
