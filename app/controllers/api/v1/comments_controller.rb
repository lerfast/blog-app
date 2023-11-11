module Api
  module V1
    class CommentsController < BaseController
      before_action :set_post, only: %i[index create]
      def index
        comments = @post.comments
        render json: comments, status: :ok
      end

      def create
        comment = @post.comments.new(comment_params.merge(user: current_user))
        if comment.save
          render json: comment, status: :created
        else
          render json: comment.errors, status: :unprocessable_entity
        end
      end

      private

      def set_post
        @post = Post.find_by(id: params[:post_id])
        render json: { error: 'Post not found' }, status: :not_found unless @post
      end

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
