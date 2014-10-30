class Comment < ActiveRecord::Base
	has_many :ratings
	belongs_to :user
	belongs_to :commentable, polymorphic: true 
end