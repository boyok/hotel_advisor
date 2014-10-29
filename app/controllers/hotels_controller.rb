class HotelsController < ApplicationController
  before_action :signed_in_user, only: [:index, :create]
  def new
    @hotel = Hotel.new
  end

  def index
    @hotels = Hotel.paginate(page: params[:page])
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def create 
  	@hotel = Hotel.new(hotel_params)
  	@hotel.user_id = current_user.user_id
  	if @hotel.save
      flash[:success] = "Hotel created!"
      redirect_to @hotel
    else 
      render 'new'
  	end
  end

  private

  	def hotel_params
  		params.require(:user).permit(:title, :stars_rating, :breakfast_included?, :room_description, :photo,
  			:price_for_room, :country, :state, :city, :street, :user_id)
  	end
end
