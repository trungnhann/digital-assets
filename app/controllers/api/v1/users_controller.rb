# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)      not null
#  full_name       :string(50)       not null
#  password_digest :string           not null
#  role            :string           default("customer")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
module Api
  module V1
    class UsersController < BaseController
      before_action :set_user, only: %i[show update destroy]

      # GET /users
      def index
        @users = User.all

        render json: @users
      end

      # GET /users/1
      def show
        render json: @user
      end

      # POST /users
      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created, location: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1
      def destroy
        @user.destroy!
      end

      def me
        if current_user
          render json: { user: current_user }, status: :ok
        else
          render json: { error: 'Invalid token' }, status: :unauthorized
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.fetch(:user, {})
      end
    end
  end
end
