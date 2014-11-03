class Hotel < ActiveRecord::Base
	belongs_to :user
	mount_uploader :photo, PhotoUploader
	#draconfly_accessor :image
	#default_scope -> { order('created_at DESC') }
	validates :title, presence: true, length: { maximum: 40 }
	validates_uniqueness_of :title, case_sensitive: false
	validates :stars_rating,  presence: true, numericality: { only_integer: true, 
					greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
	
	#validates :hotel_rating, presence: true, numericality: { only_integer: true, 
	#				greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
	delegate :name, to: :user, prefix: true
	has_one :address, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_one :ratings, foreign_key: "hotel_id", dependent: :destroy
	has_one :rating_hotel_by_users, through: :ratings #, source: :followed
	before_save { self.title = title.strip }
	#validates :user_id, presence: true
	validates :room_description, length: { maximum: 500 }
	#validates :state, length: { maximum: 30 }
	#validates :country, length: { maximum: 30 }
#	validates :city, length: { maximum: 30 }
#	validates :street, length: { maximum: 30 }

	def rating_hotel_by_users
		self.comments.average('hotel_rating').to_f*100
	end

#	def self.top_hotels
#		sql = 'SELECT hotels.* FROM hotels
#				INNER JOIN comments
#				ON hotels.id = comments.hotel_id
#				WHERE hotels.status = \'a\'
#				GROUP BY comments.hotel_id
#				ORDER BY AVG(comments.rate) DESC,
#				COUNT(comments.hotel_id) DESC
#				LIMIT 5'
#		hotels = Hotel.find_by_sql(sql)
#	end

	
end
