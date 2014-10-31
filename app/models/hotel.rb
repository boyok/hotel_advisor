class Hotel < ActiveRecord::Base
	belongs_to :user
	mount_uploader :photo, HotelPhotoUploader
	#default_scope -> { order('created_at DESC') }
	validates :title, presence: true, length: { maximum: 40 }
	validates_uniqueness_of :title, case_sensitive: false
	validates :stars_rating,  presence: true, numericality: { only_integer: true, 
					greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
	
	#validates :rating_hotel, presence: true, numericality: { only_integer: true, 
	#				greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
	
	has_one :address
	has_many :comments, as: :commentable
	before_save { self.title = title.strip }
	#validates :user_id, presence: true
	validates :room_description, length: { maximum: 500 }
	#validates :state, length: { maximum: 30 }
	#validates :country, length: { maximum: 30 }
#	validates :city, length: { maximum: 30 }
#	validates :street, length: { maximum: 30 }
#	validates :rating_hotel, presence: true
	
#	def rating_hotel
#		self.rating_hotel = (rating_hotel + rating_hotel_user)/ count_users
#	end
end
