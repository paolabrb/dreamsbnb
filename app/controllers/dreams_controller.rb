class DreamsController < ApplicationController
  def index
    @dreams = policy_scope(Dream)
  end

  def show
    @dream = Dream.find(params[:id])
    authorize @dream
  end
end
