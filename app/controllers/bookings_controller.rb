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
    @user = User.find_by(params[:user_id])
    authorize @dream
    authorize @booking
    @booking.user = @user
    @booking.dream = @dream
    if @booking.save
      redirect_to dream_path(@dream)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_booking)
  end
end
