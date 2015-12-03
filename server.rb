module App

  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions

    get "/login" do
    	erb :login
    end	

    get "/sign_up" do
    	erb :sign_up
    end	

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

    post "/articles/new" do
    	# do new article post here
    end	

    post "/articles" do
    end
end
end    