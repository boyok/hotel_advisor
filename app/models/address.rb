class Address < ActiveRecord::Base
	belongs_to :hotel
	VALID_ADDRESS_REGEX = /\A[0-9a-zA-Z #,-]+\z/
	validates :street, :city, :state, :country, allow_blank: true, format: { with: VALID_ADDRESS_REGEX }
end
