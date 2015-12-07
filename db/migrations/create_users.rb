require_relative "../db_config"

class CreateUsers < ActiveRecord::Migration
	def up
		puts "apply this thing"
		create_table :users do |t|
			t.string(:password_digest)
			t.string(:username)
		end	
	end	

	def down
		puts "undo"
		drop_table :users
	end
end	

