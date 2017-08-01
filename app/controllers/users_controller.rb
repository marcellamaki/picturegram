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
    # @picture = Picture.find(params[:id])
    # @pictures = Picture.all
  end

  # def edit
  #   @user = User.find_by(id: params[:id])
  # end
  #
  # def update
  #   @user = User.find_by(id: params[:id])
  #   @user.update(user_params)
  # end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end


end
