class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[register login]

  def register
    # user = User.find_or_initialize_by(username: params[:username])
    user = User.new(user_params)

    if user.save
      render json: { message: 'User registered successfully' }, status: :created
    else
      render json: { errors: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(username: params[:username])

    if user
      render json: user, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
