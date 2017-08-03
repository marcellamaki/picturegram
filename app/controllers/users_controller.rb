class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to signin_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    byebug
    this_user.destroy
    @session.clear

    redirect_to signup_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end


end
