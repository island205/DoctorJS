require 'digest'

class User < ActiveRecord::Base
  attr_accessible :password, :login
  validates :login, :presence => true

  def password
    @password
  end

  def password=(pass)
    return unless pass
    @password = pass
    generate_password pass
  end

  private
  def generate_password pass
    salt = Array.new(10){rand(1024).to_s(36)}.join
    self.salt, self.hashed_password =
      salt, Digest::SHA256.hexdigest(pass + salt)
  end

  ##############################Self Method########################

  def self.authenticate(login, password)
    user = User.find_by_login login
    return user if user and Digest::SHA256.hexdigest(password + user.salt) == user.hashed_password
    false
  end

end
