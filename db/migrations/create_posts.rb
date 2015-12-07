require_relative "../db_config"

class CreatePosts < ActiveRecord::Migration
	def up
		puts "apply this thing"
		create_table :posts do |t|

			t.datetime(:created_at)
			t.string(:article)
			t.string(:title_of_article)
			t.string(:image_url)
			t.references(:user)
		end	
	end	

	def down
		puts "undo"
		drop_table :posts
	end
end	

