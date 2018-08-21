module Api
  module V1
    class UsersController < ApplicationController

      def index

        render json: User.all
      end

      def create
         @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unproccesable_entity
        end
      end
      private

      def user_params
        params.require(:user).permit(:username)
      end

    end
  end
end