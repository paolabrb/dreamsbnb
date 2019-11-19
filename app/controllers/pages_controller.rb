class PagesController < ApplicationController
  def home
    @dreams = policy_scope(Dream)
  end
end
