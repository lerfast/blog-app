# app/controllers/api/v1/posts_controller.rb
module Api
  module V1
    class PostsController < BaseController
      before_action :set_user, only: [:index]

      def index
        posts = @user.posts
        render json: posts, status: :ok
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end
    end
  end
end
