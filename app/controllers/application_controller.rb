class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def current_reguser?
  #   current_user
  # end

  def require_reguser
    render file: 'public/404', status: 404 unless current_user
  end

  # def four_oh_four
  #   render file: 'public/404', status: 404
  # end

end
