module App

  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions

    get "/" do
      erb :index      
    end

    get "/articles" do
     @articles = Post.all
     erb :articles
    end	

    get "/articles/new" do
    	erb :new_articles
    end 	
end
end    