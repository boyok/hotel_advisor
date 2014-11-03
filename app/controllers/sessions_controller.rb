class SessionsController < ApplicationController
	
  def new
    redirect_to(root_url) unless current_user?(@user)
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
    	flash.now[:error] = 'Error' 
     	render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
