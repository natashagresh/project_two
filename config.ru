require "pry"
require "bcrypt"
require "sinatra"
require "redcarpet"

require_relative "db/db_config"
require_relative "server"

run App::Server