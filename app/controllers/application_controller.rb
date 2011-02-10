class ApplicationController < ActionController::Base
  protect_from_forgery

  layout "themes"

  helper_method :admin?
  
  def admin?; session[:user_id] == "admin" end
  def logged_in?
    unless admin?
      flash[:alert] = t('alert.access_denied')
      redirect_to Page.order(:position).first
    end
  end
end
