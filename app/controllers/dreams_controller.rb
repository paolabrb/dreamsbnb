class DreamsController < ApplicationController
  def index
    @dreams = policy_scope(Dream)
  end

  def show
    set_dream
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

  def destroy
    set_dream
    @dream.destroy
    redirect_to root_path
  end

  private

  def dream_params
    params.require(:dream).permit(:title, :description, :duration, :vibe)
  end

  def set_dream
    @dream = Dream.find(params[:id])
  end
end
