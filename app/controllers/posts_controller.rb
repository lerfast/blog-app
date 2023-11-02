class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy like]

  # Acción new actualizada para manejar el @user
  def new
    # Buscar el usuario por id o caer de vuelta a current_user
    @user = User.find_by(id: params[:user_id]) || current_user
    # Crear un nuevo post asociado a @user
    @post = @user.posts.build
  end

  # Acción show para mostrar un post
  def show
    @comment = Comment.new
  end

  # Acción create para guardar un nuevo post
  def create
    # Primero buscar al usuario por el ID proporcionado o caer de vuelta a current_user
    user = User.find_by(id: params[:user_id]) || current_user
    # Ahora construir el post para ese usuario
    @post = user.posts.build(post_params)
  
    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end
  
  

  # Acción edit para editar un post
  def edit; end

  # Acción update para actualizar un post existente
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # Acción destroy para eliminar un post
  def destroy
    @post.destroy
    redirect_to user_posts_path(current_user), notice: 'Post was successfully destroyed.'
  end

  # Acción like para incrementar el contador de likes de un post
  def like
    if @post.increment!(:likes_counter)
      redirect_to @post, notice: 'You liked the post!'
    else
      redirect_to root_path, alert: 'Post not found.'
    end
  end
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @posts = @user ? @user.posts : Post.none
    else
      @posts = Post.all
    end
  end
  

  private

  # Método para establecer el post utilizando el id del parámetro
  def set_post
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      flash[:alert] = 'Post not found.'
      redirect_to root_path
    end
  end

  # Método para los parámetros permitidos del post
  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end
