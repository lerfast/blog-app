class CommentsController < ApplicationController
  load_and_authorize_resource only: [:destroy]
  before_action :set_post

  def new
    @comment = Comment.new
  end
  
  def destroy
    @comment.destroy
    redirect_to post_path(@comment.post), notice: 'Comment was successfully destroyed.'
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save

      redirect_to @post, notice: 'Comment was successfully created.'
    else

      render :new
    end

    
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
