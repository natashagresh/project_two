require_relative "../config"

class CreateCategoriesPosts < ActiveRecord::Migration
	def up
		puts "apply this thing"
		create_table :categories_posts do |t|
			t.references(:category)
			t.references(:post)
		end	
	end	

	def down
		puts "undo"
		drop_table :categories_posts
	end
end	

