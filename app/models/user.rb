require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :birthday, :comments, :email, :heliskiing, :name, :password_hash, :pickle, :planet, :walnut, :spam, :password, :password_confirmation
  validates :password, confirmation: true

  include BCrypt

  has_one :billing_information
  has_one :shipping_information

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(params_password)
    password == params_password
  end
end
