class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
    @picture.tags.build
    @picture.tags.build

  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.valid?
      @picture.save
      redirect_to picture_path(@picture)
    else
      render :new
    end
  end

  def show
    @picture = Picture.find_by(id: params[:id])
    @tag = Tag.find_by(id: params[:id])
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
    params.require(:picture).permit(:image_url, :title, tag_ids:[])
  end

end
