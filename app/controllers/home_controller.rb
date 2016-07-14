class HomeController < ApplicationController
  before_action :load_church, :only => [:index]
  def index
    if user_signed_in?
      unless current_user.church.present?
        redirect_to new_church_path
      end
    else
      redirect_to home_welcome_path
    end
  end

  def welcome

  end

end
