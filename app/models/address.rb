class Address < ActiveRecord::Base
	belongs_to :hotel
	validates_presence_of :street, :city, :state, :country
end
