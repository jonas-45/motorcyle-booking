class Api::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.includes(:motorcycle).order(id: :desc)
    response_data = @reservations.map do |reservation|
      {
        id: reservation.id,
        reserve_date: reservation.reservation_date,
        reserve_time: reservation.reservation_time,
        city: reservation.city,
        motor_name: reservation.motorcycle.name
      }
    end

    render json: response_data
  end
end