class CommentsController < ApplicationController
  load_and_authorize_resource only: [:destroy]
  # Quitar before_action :set_post porque no lo necesitas para :destroy

  def new
    @comment = Comment.new
  end

  # Modificar el método :destroy para que no dependa de :set_post
  def destroy
    @comment = Comment.find(params[:id]) # Encuentra el comentario directamente
    post = @comment.post # Guarda el post antes de destruir el comentario
    @comment.destroy
    redirect_to post_path(post), notice: 'Comment was successfully destroyed.'
  end

  def create
    @post = Post.find(params[:post_id]) # Necesitas encontrar el post para crear un comentario
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
