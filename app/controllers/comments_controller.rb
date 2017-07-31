class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      # redirect_to signin_path
    else
      render :new
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.update(comment_params)
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:picture_id, :user_id)
  end

end
