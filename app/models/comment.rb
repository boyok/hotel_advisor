class Comment < ActiveRecord::Base

  belongs_to :user
  default_scope -> { order('created_at DESC') }
  belongs_to :hotel
  validates :text_comment, length: { maximum: 140 }
  validates :hotel_rating, presence: true, inclusion: { in: 1..5 }
  validates :user_id, presence: true
  validates :hotel_id, presence: true
  scope :rating_by_users, group('hotel_id')
    .where('comments.hotel_rating IS NOT NULL')
    .order('AVG(comments.hotel_rating) DESC').limit(5)
end
