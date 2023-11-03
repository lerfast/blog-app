class LikesController < ApplicationController
    before_action :set_post
  
    def create
      like = @post.likes.new(user: current_user)
  
      if like.save
        redirect_to @post, notice: 'You liked the post!'
      else
        redirect_to @post, alert: 'Could not like the post.'
      end
    end
  
    private
  
    def set_post
      @post = Post.find(params[:post_id])
    end
  end
  