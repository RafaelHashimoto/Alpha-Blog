class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "You have successfully logged in"
      session[:user_id] = user.id
      redirect_to users_path(user)
    else
      flash.now[:danger] = "wrong email or password"
      render 'new'      
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
  private
  
  def sessions_params
    params.require(:user).permit(:email, :password_digest)
  end
  
end