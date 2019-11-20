class BookingsController < ApplicationController
  def new
    set_dream
    @booking = Booking.new
    authorize @dream
    authorize @booking
  end

  def create
    set_dream
    @booking = Booking.new(booking_params)
    @user = current_user
    authorize @dream
    authorize @booking
    @booking.user = @user
    @booking.dream = @dream
    @booking.user = @user
    if @booking.save
      redirect_to user_profile_path(@user)
    else
      render :new
    end
  end

  def edit
    set_dream
    set_booking
    authorize @dream
    authorize @booking
  end

  def update
    set_dream
    set_booking
    @user = current_user
    authorize @dream
    authorize @booking
    if @booking.save
      redirect_to user_profile_path(@user)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:date_booking)
  end

  def set_dream
    @dream = Dream.find(params[:dream_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
