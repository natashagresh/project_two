require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/database.db"
)

Dir.glob("models/*.rb").each do |path|
  require_relative "../#{path}"
end 
