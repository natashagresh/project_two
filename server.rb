module App

  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions

    $markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true)

    get "/sign_up" do
    	erb :sign_up
    end	

    get "/" do  
    @user = User.find(session[:user_id]) if session[:user_id] 
      redirect to "/login" if !@user 
      erb :index      
    end

    get "/login" do
        erb :login
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
        session[:user_id] = user.id
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
    		user_id: session[:user_id],
    		created_at: DateTime.now,
    		article: params[:post],
    		title_of_article: params[:title],
    		image_url: params[:img],
           })
    	category = Category.find(params[:category_id])
    	@article.categories.push(category)
    	@article.save

        redirect to "/articles"
    end

    # View a form to edit an article
    get "/articles/:id/edit" do
        id = params[:id]
        @article = Post.find_by(id: id)
        @categories = Category.all
        erb :edit_article
    end    
    
    # Submit updates to an article
    patch "/articles/:id" do
        @article = Post.find(params['id'])
        @article.update({ 
        	user_id: session[:user_id],
        	created_at: DateTime.now, 
        	article: params["post"],
        	title_of_article: params["title"],
        	image_url: params["img"]})
        category = Category.find(params[:category_id])
        @article.categories.push(category)
        redirect to "/articles"
    end    

    # Delete an article
    delete "/articles/:id" do
        id = params['id']
        @article = Article.find_by({id: id})
        @article.destroy
        redirect to "/articles"
    end



end
end    