class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to home_path
  end

end
