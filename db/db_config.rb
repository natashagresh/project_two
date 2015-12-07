require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

if ENV['RACK_ENV'] == "production"
	# set up for postgres db on heroku
   require 'uri'
     db = URI.parse(ENV['DATABASE_URL'])
      ActiveRecord::Base.establish_connection({
     :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
     :host     => db.host,
     :username => db.user,
     :password => db.password,
     :database => db.path[1..-1],
     :encoding => 'utf8'
  })

else 

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/database.db"
)

end

Dir.glob("models/*.rb").each do |path|
  require_relative "../#{path}"
end 
