# Requiring the ruby file we used to set up
# and configure the connection we made to 
# our sqlite3 database

require_relative "db_config.rb"
CategoriesPost.delete_all
Category.delete_all
Post.delete_all
PostsUser.delete_all
User.delete_all

# Using our models to seed our database!
# We're just creating new rows in our DB
# using dummy data.

# We pass in a hash of information where
# the keys are the column names in our table,
# and the values are whatever made up info
# we want to add in.

CategoriesPost.create({
  category_id: 1,
  post_id: 1
  })
Category.create({
  category_name: "cool stuff"
  })
Post.create({
  created_at: DateTime.now,
  updated_at: DateTime.now,
  article: "This is an article!!",
  title_of_article: "Article Title here!",
  image_url: "http://i.giphy.com/qrlOmXoTgHAd2.gif",
  author_id: 1,
  })
PostsUser.create({
  user_id: 1,
  post_id: 1
  })
User.create({
  username: "ilovewaffles22",
  password: "waffle4"
  })