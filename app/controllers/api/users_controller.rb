class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def register
    user = User.find_or_initialize_by(username: params[:username])

    if user.save
      render json: user, status: :created
    else
      render json: { error: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(username: params[:username])

    if user
      render json: user
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def current_user_id
    user = User.find_by(username: params[:username])
    if user
      render json: { id: user.id }
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end
end
