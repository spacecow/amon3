class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter  :set_p3p

  layout "themes"

  helper_method :admin?
  
  def admin?; session[:user_id] == "admin" end
  def logged_in?
    unless admin?
      flash[:alert] = t('alert.access_denied')
      redirect_to Page.order(:position).first
    end
  end

  private

    def set_p3p
      response.headers["P3P"]='CP="CAO PSA OUR"'
    end
end
