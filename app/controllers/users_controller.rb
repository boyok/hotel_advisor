class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:edit, :update, :destroy, :create]

  def new
    unless admin_user
      redirect_to(root_url) unless current_user?(@user)
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if admin_user?
        redirect_to admin_path
        flash[:success] = 'User created!'
      else
        sign_in @user
        flash[:success] = 'Account created!'
        redirect_to @user
      end
    else
      render 'new'
    end
  end

  def edit; end

  def show
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to admin_path
  end
  def index
    @users = User.all
    #@hotel_count = Hotel.find_by(user_id: params[:user_id]).count
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    current_user.admin?
  end
end
