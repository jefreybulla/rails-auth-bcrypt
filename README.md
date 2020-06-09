# README

This demo shows how to 
- Set up a basic authentication strategy using the bcrypt gem.
- Share session cokies with another app that lives in a subdomain of this app
- Extra: Use One Time Pad to encrypt a message

## Companion app
Use in conjuction with this [React app](https://github.com/jefreybulla/node-react) to share the Rails session cookies.

## Demo URL
http://rails.toro-labs.com/

## Requirements

- Ruby 2.4.5
- Postgresql 11 (db name: rails_auth)

## Build
```
$ createdb rails_auth
$ bundle install
$ rails db:migrate
$ rails server
```

## Setting up cookies 
Share cookies with a subdomain (my_subdomain.rails.toro-labs.com) in config/initializers/session_store.rb

```
Rails.application.config.session_store :cookie_store, key: '_rails-auth_session', same_site: 'Strict', domain: 'rails.toro-labs.com'
```
## Setting up headers
Allow a subdomain to send credectials (session cookies) in config/environments/production.rb
```
  config.action_dispatch.default_headers = {
    'Access-Control-Allow-Origin' => 'http://react.rails.toro-labs.com',
    'Access-Control-Allow-Credentials' => 'true',
    'Access-Control-Request-Method' => 'GET'
  }
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

## Gem Documentation
https://github.com/codahale/bcrypt-ruby

## Using One Time Pad encryption
Feel free to test the encryption with your own secret by editing /lib/task/one_time_pad.rake.

Run with:
```
$ rake one_time_pad
```
