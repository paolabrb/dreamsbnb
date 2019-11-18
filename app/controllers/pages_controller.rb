class PagesController < ApplicationController
  def home
    @dreams = Dream.all
  end
end
