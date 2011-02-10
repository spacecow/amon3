class SessionsController < ApplicationController
  def new
  end

  def create
    if authenticate(params[:login], params[:password])
      session[:user_id] = "admin"
      redirect_to Page.order(:position).first, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end

  private

  def authenticate(login, pass)
    matching_password?(pass) if login == SITE_CONFIG[:admin]
  end

  def matching_password?(pass)
    encrypt_password(SITE_CONFIG[:passw]) == encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, SITE_CONFIG[:salt])
  end  
end
