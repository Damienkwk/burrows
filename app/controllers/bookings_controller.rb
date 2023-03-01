class BookingsController < ApplicationController
  before_action :set_flat, only: %i[create]
  before_action :set_booking, only: %i[show edit update]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    @booking.status = 'pending'
    if @booking.save
      redirect_to bookings_path
    else
      render 'flats/show', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_of_guests, :status)
  end
end
