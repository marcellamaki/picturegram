class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
    @picture.tags.build
  end

  def create
    @picture = Picture.new(picture_params)
    # byebug
    if @picture.valid?
      # tag_params
      @picture.save
      redirect_to picture_path(@picture)
    else
      render :new
    end
  end

  def show
    @picture = Picture.find_by(id: params[:id])
    @tag = Tag.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @picture.comments.includes(:user)
  end

  def edit
    @picture = Picture.find_by(id: params[:id])
  end

  def update
    @picture = Picture.find_by(id: params[:id])
    @picture.update(picture_params)
  end

  def destroy
    @picture = Picture.find_by(id: params[:id])
    @picture.destroy
  end

  private

  def picture_params
    params.require(:picture).permit(:image_url, :title, :user_id, :tag_ids => [])
  end
  # def tag_params
  #   params.require(:tag).permit(:tag_ids)
  # end

end
