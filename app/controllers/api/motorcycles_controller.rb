class Api::MotorcyclesController < ApplicationController
  def index
    @motorcycles = Motorcycle.all
    render json: @motorcycles
  end
end
