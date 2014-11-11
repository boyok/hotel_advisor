class CommentsController < ApplicationController

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
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'Comment add!'
      redirect_to @hotel
    else
      flash.now[:error] = 'Invalid title/stars rating'
      render 'hotels/show'
    end
  end

  def destroy; end

  private

  def comment_params
    params.require(:comment).permit(
      :text_comment,
      :hotel_rating,
      :hotel_id,
      :user_id
    )
  end
end
