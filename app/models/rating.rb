class Rating < ActiveRecord::Base
	belongs_to: :hotel_id, class_name: "Hotel"
	belongs_to: :rating_hotel_by_user, class_name: "Comment"
	validates :follower_id, presence: true
  	validates :followed_id, presence: true

  	
end
