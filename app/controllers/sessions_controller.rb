class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.password == params[:password]
      session[:user_id] = user.id
      cookies.encrypted[:test_cookie] = "test cookie" * 100
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password is incorrect'
      puts 'Email or password is incorrect!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete(:test_cookie)
    redirect_to root_url, notice: 'Logged out!'
  end
end
