class DreamsController < ApplicationController
  def show
    @dream = Dream.find(params[:id])
  end
end
