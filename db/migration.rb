require_relative "migrations/create_categories.rb"
require_relative "migrations/create_posts.rb"
require_relative "migrations/create_users.rb"
require_relative "migrations/create_categoryposts.rb"


CreateCategories.migrate(:up)
CreateCategoriesPosts.migrate(:up)
CreatePosts.migrate(:up)
CreateUsers.migrate(:up)