class Address < ActiveRecord::Base
	belongs_to :hotel
	VALID_ADDRESS_REGEX = /\A[0-9a-zA-Z #,-]+\z/
	validates :street, :city, :state, :country, allow_blank: true, format: { with: VALID_ADDRESS_REGEX }
	validates :state, length: { maximum: 30 }
	validates :city, length: { maximum: 30 }
	validates :street, length: { maximum: 30 }
	
end
