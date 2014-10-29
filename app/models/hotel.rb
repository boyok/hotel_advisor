class Hotel < ActiveRecord::Base
	#belonds_to :user
	#mount :photo, PhotoUploader
	default_scope -> { order('created_at DESC') }
	validates :title, presence: true, length: { maximum: 40 }
	#validates :stars_rating, presence: true
	#validates :user_id, presence: true
	#validates :room_description, length: { maximum: 500 }
	#validates :state, length: { maximum: 30 }
	#validates :country, length: { maximum: 30 }
	#validates :city, length: { maximum: 30 }
	#validates :street, length: { maximum: 30 }
	
	def rating_hotel
		self.rating_hotel = (rating_hotel + rating_hotel_user)/ count_users
	end
end
