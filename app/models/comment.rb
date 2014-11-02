class Comment < ActiveRecord::Base
	#has_many :ratings
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	belongs_to :hotel
	validates :text_comment, length: { maximum: 140 }
	validates :hotel_rating, presence: true, inclusion: { in: 1..5 }
	validates :user_id, presence: true
	validates :hotel_id, presence: true
	


end