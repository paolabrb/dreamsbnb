class PagesController < ApplicationController
  def home
    @dreams = policy_scope(Dream)
  end

  def user_profile
  end
end
