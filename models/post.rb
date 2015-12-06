class Post < ActiveRecord::Base
  # seting up relationship between users and posts
  # has_many :posts_users    
  # has_many :users, through: :posts_users
  # # setting up relationship between posts and categories
  # has_many :categories_posts 
  # has_many :categories, through: :categories_posts 
  # # Setting up a method to get the author in a simple great wonderful easy way
  # # Changed this to "belongs_to"
  # belongs_to :author, class_name: "User"

  has_and_belongs_to_many :categories
  belongs_to :user
end
