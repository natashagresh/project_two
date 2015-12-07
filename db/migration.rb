require_relative "migrations/create_categories.rb"
require_relative "migrations/create_posts.rb"
require_relative "migrations/create_users.rb"
require_relative "migrations/create_categoryposts.rb"


CreateCategories.migrate(ARGV[0])
CreateCategoriesPosts.migrate(ARGV[0])
CreatePosts.migrate(ARGV[0])
CreateUsers.migrate(ARGV[0])

