# app/controllers/api/v1/users_controller.rb
module Api
    module V1
      class UsersController < BaseController
        def show
          user = User.find_by(id: params[:id])
          if user
            render json: user, status: :ok
          else
            render json: { error: 'User not found' }, status: :not_found
          end
        end
      end
    end
  end
  