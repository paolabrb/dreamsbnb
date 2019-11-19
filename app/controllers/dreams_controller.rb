class DreamsController < ApplicationController
  def index
    @dreams = policy_scope(Dream)
  end

  def show
    @dream = Dream.find(params[:id])
    authorize @dream
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

  private

  def dream_params
    params.require(:dream).permit(:title, :description, :duration, :vibe)
  end
end
