class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.includes(:posts).all
  end

  def show
    @user = User.find(params[:id])
    @three_most_recent_posts = @user.three_most_recent_posts
    @post_count = @user.posts.count
    @recent_posts = @user.posts.select(:id, :title).order(created_at: :desc).limit(3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
