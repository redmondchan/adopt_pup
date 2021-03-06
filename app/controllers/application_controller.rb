class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to "/sessions/new" unless logged_in?
  end

  def index
    current_user
  end

end
