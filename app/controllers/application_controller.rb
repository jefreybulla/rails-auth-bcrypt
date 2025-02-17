class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  end

  def data 
    if u = User.find_by_id(session[:user_id])
      puts "session: #{u.email}"
      render json: {user: u.email }
    else
      render json: {error: "no access" }
    end
  end

  private 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end

end
