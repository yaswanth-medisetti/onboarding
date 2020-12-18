class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create, :welcome]

  def new
  end

  def create

    @logged_in_user = User.find_by(email: params[:username])

    # If user exists, it is set in session.
    # User id is used as unique identifier in session
    # If user not available, 401 is sent as response
    if @logged_in_user && @logged_in_user.authenticate(params[:password])
      session[:current_user_id] = @logged_in_user.id
      redirect_to_root
    else
      render json: {status: 401}
    end
  end

  def logout
    session.delete(:current_user_id)
    @logged_in_user = nil
    redirect_to_root
  end

  private
  def redirect_to_root
    redirect_to '/'
  end


  def login
  end

  def welcome
  end
end
