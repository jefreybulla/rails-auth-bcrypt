require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  validates :email, :password, presence: true
  validates_uniqueness_of :email

  # method to verify password
  def password
    @password ||= Password.new(password_digest)
  end

  # method to create a new password
  def password=(new_password)
    if new_password != ''
      @password = Password.create(new_password)
      self.password_digest = @password
    end
  end
  
end
