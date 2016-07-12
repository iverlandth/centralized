class HomeController < ApplicationController
  before_action :load_church, :only => [:index]
  def index
    if user_signed_in?
    else
      redirect_to home_welcome_path
    end
  end

  def welcome

  end

end
