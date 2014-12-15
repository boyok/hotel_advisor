class AdminController < ApplicationController
  before_action :signed_in_user, only: [:index, :destroy]
  before_action :admin_user, only: [:index, :destroy]

  #def new
  #  @user = User.new
 # end
  
 # def create
 #   @user = User.new(user_params)
  #  if @user.save
 #    flash[:success] = 'User created!'
 #    redirect_to admin
 #   else
  #   render 'new'
 #   end
 # end
  
  def index
    @users = User.all
    #@hotel_count = Hotel.find_by(user_id: params[:user_id]).count
  end

  

  private
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
 # def user_params
#    params.require(:user).permit(
#      :name,
#      :email,
#      :password,
#      :password_confirmation,
#      :admin
#  end
end
