class HotelsController < ApplicationController
   before_action :current_hotel, only: [:show, :edit, :update, :destroy]
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
  	#@hotel.user_id = current_user.user_id
  	if @hotel.save
     # hotel_path @hotel

      flash[:success] = "Hotel created!"
      render 'show'
    else 
      render 'new'
  	end
  end


  def edit
  end

  def update
    if @hotel.update(hotel_params)
      flash[:success] = "Hotel updated!"
      redirect_to @hotel
    else
      render 'edit'
    end
  end

  def destroy
    @hotel.destroy
    redirect_to hotels_url
  end



  private


    def current_hotel
      @hotel = Hotel.find(params[:id])      
    end

  	def hotel_params
  		params.require(:hotel).permit(:title, :stars_rating, :breakfast_included?, :room_description, :photo,
  			:price_for_room, :country)#, #:state, :city, :street, :rating_hotel, :user_id)
  	end
end
