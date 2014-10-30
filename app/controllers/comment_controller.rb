class CommentsController < ApplicationController
 	before_action :current_comment, only: [:show, :edit, :update, :destroy]
	before_action :signed_in_user, only: [:new, :create, :edit, :save] 
	def index 
		@commentable = find_commentable
		@comments = @commentable.comments
	end 

	def new
	end

	def create
		@comment = Coment.new(comment_params)
	end

	def find_commentable
		params.each do |name, value|
			$1.classify.constantize.find(value)	if name =~ /(.+)_id$/
		end
	end

	private 
	
		def current_comment
			@comment = Comment.find(params[:id])
		end

		def comment_params
			params.require(:comment).permit(:text_comment, :count_comments, :hotel_id)
		end
end
