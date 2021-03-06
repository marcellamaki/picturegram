require 'pry'

class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.valid?
      @tag.save
      redirect_to tag_path(@tag)
    else
      render :new
    end
  end

  def show
    @tag = Tag.find_by(id: params[:id])
  end

  def edit
    @tag = Tag.find_by(id: params[:id])
  end

  def update
    @tag = Tag.find_by(id: params[:id])
    @tag.update(tag_params)
  end

  def destroy
    @tag = Tag.find_by(id: params[:id])
    @tag.destroy

    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end


end
