class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    puts params[:user]
    puts "here!!!"
    @user = User.new(params.require(:user).permit(:email, :password))

    begin
      @user.save!
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    rescue => e
      puts "####################"
      puts " Error #{e.message}"
      render 'new'
    end
  end

end
