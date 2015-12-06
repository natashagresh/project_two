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
    
    post "/sessions" do
    	redirect to '/'
    end
    
    delete "/sessions" do
      session[:user_id] = nil
      redirect to "/login"
    end 	

    post "/post" do
    	@user = User.create(username: params["name"], password: params["password"], password_confirmation: params["password_confirmation"])
    	redirect to "/"
    end	

    get "/" do	
      @user = User.find(session[:username])	if session[:username]
      erb :index      
    end

    post "/" do
    # Try to find user in DB
      user = User.find_by({
        username: params[:name]
      }).try(:authenticate, params[:password])
      if user
      #  Save their ID into the session!
        session[:username] = user.id
        redirect to "/"
      else 
        redirect to "/redirect"
      end
    end

    get "/redirect" do
    	erb :redirect
    end	

    get "/articles" do
     @articles = Post.all
     erb :articles
    end	

    get "/articles/:id" do
    	@article = Post.find(params[:id])
    	@category = Category.find(@article.category_id)
    	erb :view_article
    end	

    get "/categories" do
    	@categories = Category.all
        erb :categories
    end	

    get "/categories/:id" do
    	@category = Category.find(params[:id])
    	@articles = @category.posts
    	erb :category_id
    end	

    get "/new_articles" do
    	@categories = Category.all
    	erb :new_articles   	
    end 

    post "/new_articles" do
    	@article = Post.create({
    		author: session[:username],
    		created_at: DateTime.now,
    		article: params[:post],
    		title_of_article: params[:title],
    		image_url: params[:img],
            category_id: params[:category_id]})
    	category = Category.find(params[:category_id])

    	@article.categories.push(category)
    	@article.save

        redirect to "/articles"
    end

    # get "/users" do
    # 	@users = User.all
    # 	erb :users
    # end	


end
end    