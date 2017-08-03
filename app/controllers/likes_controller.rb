class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def create
    @picture = Picture.find(params[:format])
    @like = Like.create(:user => this_user, :picture => @picture)
      redirect_to picture_path(@picture)
  end

  def show
    @like = Like.find_by(id: params[:id])
    @picture = Picture.find_by(id: params[:id])
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :picture_id => [])
  end

end
