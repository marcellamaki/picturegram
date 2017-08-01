class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    # @comment = Comment.new(comment_params)
    # @comment.save
    # @picture = Picture.find(params[:picture_id])
    #   redirect_to picture_path(@picture)
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params)
    @comment.user = this_user

    if @comment.save
      redirect_to picture_path(@picture)
    else
      render :new
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    @picture = Picture.find_by(id: params[:id])
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
    params.require(:comment).permit(:content, :user_id, :picture_id => [])
  end

end
