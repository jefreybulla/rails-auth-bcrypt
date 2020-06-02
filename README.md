# README

This demo shows how to set up a basic authentication strategy using the bcrypt gem.

## Requirements

- Ruby 2.4.5
- Postgresql 11 (db name: rails_auth)

## Build
```
$ bundle install
$ rails db:migrate
$ rails server
```
## User model
```
require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  
  validates_uniqueness_of :email

  # method to verify password
  def password
    @password ||= Password.new(password_digest)
  end

  # method to create a new password
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
  
end
```

## Creating a new user
```
  def create
    @user = User.new(params.require(:user).permit(:email, :password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end
```
## Creating a session (authenticating an existing user)
```
  def create
    user = User.find_by_email(params[:email])
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      puts 'Email or password is incorrect!'
      render 'new'
    end
  end
```

## Documentation
https://github.com/codahale/bcrypt-ruby
