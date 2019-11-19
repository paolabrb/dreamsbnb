class PagesController < ApplicationController
  def home
    @dreams = policy_scope(Dream)
  end

  def profile
    @user = User.find(params[:id])
    @dreams = @user.dreams
  end
end
