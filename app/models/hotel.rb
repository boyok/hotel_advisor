class Hotel < ActiveRecord::Base
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :title, presence: true, length: { maximum: 40 }
  validates_uniqueness_of :title, case_sensitive: false
  validates :stars_rating,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 5
            }
  delegate :name, to: :user, prefix: true
  has_one :address, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :rating_hotel_by_users, through: :ratings
  before_save { self.title = title.strip }
  validates :room_description, length: { maximum: 500 }

  def rating_hotel_by_users
    self.comments.average('hotel_rating').to_f * 100
  end
end
