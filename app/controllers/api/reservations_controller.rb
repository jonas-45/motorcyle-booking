class Api::ReservationsController < ApplicationController
  # before_action :set_reservation, only: [:destroy]
  before_action :set_user, only: %i[create]

  def index
    user = User.find_by(username: params[:username])
    @reservations = Reservation.includes(:motorcycle).where(user_id: user.id).order(id: :desc)
    response_data = @reservations.map do |reservation|
      {
        id: reservation.id,
        reserveDate: reservation.reservation_date,
        reserveTime: reservation.reservation_time,
        city: reservation.city,
        userId: reservation.user_id,
        motorName: reservation.motorcycle.name
      }
    end

    render json: response_data
  end

  def create
    existing_reservation = Reservation.find_by(motorcycle_id: params[:motorcycle_id],
                                               reservation_date: params[:reservation_date])

    if existing_reservation
      render json: { error: 'Reservation for this motorcycle and date already exists' }, status: :unprocessable_entity
    else
      @reservation = @user.reservations.build(reservation_params)

      if @reservation.save
        render json: @reservation, status: :created
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end
  end

  # Other actions and private methods
  def destroy
    if @reservation.destroy
      render json: { message: 'Reservation deleted successfully!' }
    else
      render json: { error: 'Failed to delete the reservation' }, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
    return if @user

    render json: { error: 'User not found' }, status: :not_found
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :motorcycle_id, :reservation_date, :city)
  end
end
