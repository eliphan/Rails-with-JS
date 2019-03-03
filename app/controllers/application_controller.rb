class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  # before_action :current_user
  # helper_method :current_user
  # before_action :require_logged_in, except: [:new, :create, :home]

  def logged_in?
  !!current_user
  end

  def set_user
    @user = current_user
  end
  
  private
  def require_logged_in
    redirect_to root_path unless logged_in?
  end

end
