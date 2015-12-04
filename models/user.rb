require("bcrypt")

class User < ActiveRecord::Base
  has_secure_password	
  has_many :posts_users	
  has_many :posts, through: :posts_users
end