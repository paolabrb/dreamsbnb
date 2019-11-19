class BookingsController < ApplicationController
  def new
    @dream = Dream.find(params[:dream_id])
    @booking = Booking.new
    authorize @dream
    authorize @booking
  end

  def create
    @dream = Dream.find(params[:dream_id])
    @booking = Booking.new(booking_params)
    authorize @dream
    authorize @booking
    @booking.dream = @dream
  end

  private

  def booking_params
    params.require(:booking).permit(:date_booking, :amount, :user)
  end
end
