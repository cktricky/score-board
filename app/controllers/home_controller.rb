class HomeController < ApplicationController
  skip_before_filter :authenticated

  def index
  end
end