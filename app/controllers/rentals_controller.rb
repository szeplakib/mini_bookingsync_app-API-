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
    json_response(@rental)
  end

  def update
    @rental.update(rental_params)
    head :no_content
  end

  def destroy
    @rental.destroy
    head :no_content
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.permit(:name, :daily_rate)
  end
end
