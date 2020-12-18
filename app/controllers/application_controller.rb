class ApplicationController < ActionController::Base
  before_action :authenticate_user

  helper_method :current_user

  def current_user
    return @logged_in_user
  end
  private

  def authenticate_user
    @logged_in_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])

    unless @logged_in_user then redirect_to 'http://localhost:3000/login' end
  end
end
