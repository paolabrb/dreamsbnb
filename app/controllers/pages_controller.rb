class PagesController < ApplicationController
  def home
    @dreams = policy_scope(Dream)
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
