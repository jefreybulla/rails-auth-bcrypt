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
