class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_locale
  
  def set_locale
    if session[:locale].nil?
      session[:locale] = I18n.locale = :en
    else
      if not params[:locale].nil?
        if params[:locale] == "en" || params[:locale] == "fr"
          session[:locale] = I18n.locale = params[:locale]
        else
          session[:locale] = I18n.locale = :en
        end
      else
        I18n.locale = session[:locale]
      end
    end
  end

end
