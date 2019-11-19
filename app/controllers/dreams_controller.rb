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
    @dream.save
    redirect_to root_path
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

  private

  def dream_params
    params.require(:dream).permit(:title, :description, :duration, :vibe)
  end

  def set_dream
    @dream = Dream.find(params[:id])
  end
end
