class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

  def default_url_options(options = {})
    if user_signed_in?
      church = Church.find(params[:church_id]) if params[:church_id]
      if current_user.church_id.present?
        church = Church.find(current_user.church_id)
        {locale: I18n.locale, church_id: church.id}.merge options
      else
        {locale: I18n.locale}.merge options
        #redirect_to new_church_path
      end

    else
      {locale: I18n.locale}.merge options
    end

  end

  def load_church
    if user_signed_in?
      @church = Church.find(params[:church_id]) if params[:church_id]
      @church = Church.find(current_user.church_id)
    else
      redirect_to root_url
    end
  end

end
