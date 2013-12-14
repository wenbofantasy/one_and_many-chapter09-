class User < ActiveRecord::Base
  attr_accessible :birthday, :comments, :email, :heliskiing, :name, :password_hash, :pickle, :planet, :walnut
end
