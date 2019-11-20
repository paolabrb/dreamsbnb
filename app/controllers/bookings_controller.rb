class BookingsController < ApplicationController
  def new
    set_dream
    authorize @dream
    @booking = Booking.new
    authorize @booking
  end

  def create
    set_dream
    authorize @dream
    @booking = Booking.new(booking_params)
    authorize @booking
    set_user
    @booking.user = @user
    @booking.dream = @dream
    if @booking.save
      redirect_to user_profile_path(@user)
    else
      render :new
    end
  end

  def edit
    @dream = Dream.find(params[:dream_id])
    @booking = Booking.find_by dream_id: @dream
    authorize @booking
  end

  def update
    @dream = Dream.find(params[:dream_id])
    set_booking
    authorize @booking
    set_user
    @booking.user = @user
    @booking.dream = @dream
    @booking.update(booking_params)
    redirect_to user_profile_path(@user)
  end

  def destroy
    set_dream
    set_booking
    authorize @booking
    set_user
    @booking.destroy
    redirect_to user_profile_path(@user)
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

  def set_user
    @user = current_user
  end
end
