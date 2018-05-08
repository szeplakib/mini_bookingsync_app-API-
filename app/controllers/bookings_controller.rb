class BookingsController < ApplicationController
  before_action :set_rental, only: %i[index show create update destroy]
  before_action :set_rental_booking, only: %i[show update destroy]

  def index_all
    json_response(Booking.all)
  end

  def index
    json_response(@rental.bookings)
  end

  def show
    json_response(@booking)
  end

  def create
    @rental.bookings.create!(booking_params)
    json_response(@rental.bookings.last, :created)
  end

  def update
    @booking.update!(booking_params)
    json_response(@booking, :ok)
  end

  def destroy
    @booking.destroy
    head 204
  end

  private

  def booking_params
    params[:price] = (params[:end_at].to_date - params[:start_at].to_date) * @rental[:daily_rate]
    params.permit(:start_at, :end_at, :client_email, :price)
  end

  def set_rental
    @rental = Rental.find(params[:rental_id])
  end

  def set_rental_booking
    @booking = @rental.bookings.find_by!(id: params[:id])
  end
end
