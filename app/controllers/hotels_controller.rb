class HotelsController < ApplicationController
  #before_action :correct_hotel, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:index, :show, :create, :update, :edit, :count_comments]

  def new
    @hotel = Hotel.new
    @address = @hotel.build_address
  end

  def count_comments
    @count_comments = Hotel.joins(:comments).where(comments: {count: 5}.limit(5))
  end

  def index
    @hotels = Hotel.paginate(page: params[:page])
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def create 
  	@hotel = Hotel.new(hotel_params)
    @address = @hotel.build_address(address_params)
   # 
  	#@hotel.user_id = current_user.user_id
  	if @hotel.save && @address.save

      flash[:success] = "Hotel created!"
      redirect_to hotels_path
    else 
      redirect_to new_hotel_path
    end
    #end
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


    def correct_hotel
      #@hotel = Hotel.find(params[:id])      
    end

  	def hotel_params
  		params.require(:hotel).permit(:title, :stars_rating, :breakfast_included, :room_description, :photo,
  			:price_for_room, :rating_hotel) 
  	end

    def address_params
      params.require(:address).permit(:country, :city, :state, :street)
    end

end