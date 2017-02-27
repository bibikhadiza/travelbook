class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end



  def home
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end

  private

  def check_logged_in?
    if !user_signed_in?
      redirect_to "/"
      flash[:notice] = "Please Log in or Sign Up to Navigate Site"
    end
  end





end
