class PictureTagsController < ApplicationController

  def index
    @picture_tags = PictureTag.all
  end

  def new
    @picture_tag = PictureTag.new
  end

  def create
    @picture_tag = PictureTag.new(picture_tag_params)
    if @picture_tag.valid?
      @picture_tag.save
      # redirect_to signin_path
    else
      render :new
  end

  def show
    @picture_tag = PictureTag.find_by(id: params[:id])
  end

  def edit
    @picture_tag = PictureTag.find_by(id: params[:id])
  end

  def update
    @picture_tag = PictureTag.find_by(id: params[:id])
    @picture_tag.update(picture_tag_params)
  end

  def destroy
    @picture_tag = PictureTag.find_by(id: params[:id])
    @picture_tag.destroy
  end

  private

  def picture_tag_params
    params.require(:picture_tag).permit(:picture_id, :tag_id)
  end

end
