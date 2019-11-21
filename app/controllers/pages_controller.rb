class PagesController < ApplicationController
  def home
    if params[:query].present?
      @dreams = Dream.search_by_vibe(params[:query])
    else
      @dreams = policy_scope(Dream)
    end
  end

  def profile
    @user = User.find(params[:id])
    @dreams = @user.dreams
  end

  def edit_profile
    @user = current_user
    @dreams = @user.dreams
  end

  def edit_update
    @user = params[:photo]
  end
end
