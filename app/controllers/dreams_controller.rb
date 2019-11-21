class DreamsController < ApplicationController
  before_action :authenticate_user!
  def index
    # if params[:query].present?
    #   @dreams = Dream.search_by_vibe(params[:query])
    # else
    #   @dreams = policy_scope(Dream)
    # end
    @dreams = Dream.first

    # @dreams = Dream.search_by_vibe('Fun')
  end

  def show
    set_dream
    authorize @dream
    @booking = Booking.find_by dream_id: @dream
  end

  def new
    @dream = Dream.new
    authorize @dream
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = current_user
    authorize @dream
    if @dream.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    set_dream
    authorize @dream
  end

  def update
    set_dream
    @dream.update(dream_params)
    authorize @dream
    @dream.save
    redirect_to dream_path(@dream)
  end

  def destroy
    set_dream
    authorize @dream
    @dream.destroy
    redirect_to root_path
  end

  private

  def dream_params
    params.require(:dream).permit(:title, :description, :duration, :vibe, :photo)
  end

  def set_dream
    @dream = Dream.find(params[:id])
  end
end
