require_relative "../config"

class CreateCategories < ActiveRecord::Migration
	def up
		puts "apply this thing"
		create_table :categories do |t|
			t.string(:category_name)
		end	
	end	

	def down
		puts "undo"
		drop_table :categories
	end
end	


