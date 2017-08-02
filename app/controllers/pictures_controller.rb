class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
    @picture.tags.build
    @picture.picture_tags.build.build_tag
  end

  def create
    # new tag isn't saving
    # make tag belong_to picture?
    @picture = Picture.create(picture_params)
    if params[:picture][:tags][:name].present?
      new_tag = Tag.create(name: params[:picture][:tags][:name])
      @picture.tags << new_tag
    end
      # tag_params
      # @picture.save
      redirect_to picture_path(@picture)
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
    @picture.user = this_user
    @picture.destroy
    if @picture.destroy
      redirect_to user_path(@this_user)
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:image_url, :title, :user_id, :picture_id, :tag_ids => [])
  end

  # def tag_params
  #   params.require(:tag).permit(:tag_ids)
  # end

end
