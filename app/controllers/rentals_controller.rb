class RentalsController < ApplicationController
  include RentalsHelper
  before_action :set_rental, only: %i[show update destroy]
  def index
    @rentals = Rental.all
    json_response(@rentals)
  end

  def create
    @rental = Rental.create!(rental_params)
    json_response(@rental, :created)
  end

  def show
    json_response(
      rental: @rental,
      bookings: @rental.bookings
    )
  end

  def update
    @rental.update!(rental_params)
    json_response({}, 200)
  end

  def destroy
    @rental.destroy
    head 204
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.permit(:name, :daily_rate)
  end
end
