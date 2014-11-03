class CommentsController < ApplicationController
 	#before_action :current_hotel, only: [:show, :edit, :update, :destroy]
	before_action :signed_in_user, only: [:create, :destroy] 
	
	def index 
		@hotels = Hotel.paginate(page: params[:page])
	end 

	def new
		@comment = Comment.new
	end
	
	def show
		@comment = Comment.find(params[:hotel_id])
	end

	def create
		#@comment = Comment.new(comment_params)
		@hotel = Hotel.find(params[:hotel_id])
		@comment = @hotel.comments.create(comment_params)#.merge({ hotel_id: @hotel.id, user_id: current_user.id})
		@comment.user_id = current_user.id
	#	@hotel.rating_hotel_by_user = @comment.rating_hotel_by_user 
		if @comment.save
			flash[:success] = "Comment add!"

			redirect_to @hotel
		else
			render 'hotels/show'
		end
	end

	

	def destroy
	end



	private 
	
		#def current_hotel
		#	@comment = current_hotel.comments.find_by(id: params[:id])
		#	redirect_to root_url if @comment.nil?	
			#@comment = Comment.find(params[:id])
		#end

		def comment_params
			params.require(:comment).permit(:text_comment, :hotel_rating, :hotel_id, :user_id)
		end
end
