enable :sessions

get '/' do # Display all posts
  puts session[:user].inspect
  if session[:user] != nil

    @login = "<p>Logged in as #{User.where(id: session[:user]).first.name},</p><p><a href='/submit'>Create new post</a></p>"
  else
    @login = "<a href='/login'>Log in</a>"
  end
  @posts = Post.all
  @counter = 0
  erb :index # Display only title
end

get '/user/:user_id' do # User page, links to their comments and submissions
  @user = User.where(id: params[:user_id]).first
  erb :user
end

get '/user/:user_id/posts' do # User's posts
  @user = User.where(id: params[:user_id]).first
  @posts = Post.where(user_id: @user.id)
  erb :posts # Filter out first, Only title
end

get '/user/:user_id/comments' do # User's comments
  @user = User.where(id: params[:user_id]).first
  @comments = Comment.where(user_id: @user.id)
  erb :comments
end

get '/post/:post_id' do # Specific post with all Comments
  @post = Post.where(id: params[:post_id]).first
  @comments = Comment.where(post_id: params[:post_id])
  @user = User.where(id: @post.user_id).first
  erb :post
end

get '/login' do
  @error = ""
  erb :login
end

post '/login' do
  if User.where(name: params[:name], pass: params[:pass]) != []
    session[:user] = User.where(name: params[:name], pass: params[:pass]).first.id
    # Copied from "/"
    if session[:user] != nil
      @login = "<p>Logged in as #{User.where(id: session[:user]).first.name},</p><p><a href='/submit'>Create new post</a></p>"
    else
      @login = "<a href='/login'>Log in</a>"
    end
    @posts = Post.all
    @counter = 0
    erb :index # Display only title
    # Copied from "/"
  else
    @error = " - Invalid username/password -"
    erb :login
  end
end

get '/sign_up' do
  @error = ""
  erb :sign_up
end

post '/sign_up' do
  if User.where(name: params[:name]) == []
    User.create(name: params[:name], pass: params[:pass])
    erb :login
  else
    @error = " - Username is taken -"
    erb :sign_up
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/submit' do
  erb :submit
end

post '/submit' do
  if session[:user] != nil
    lol = Post.create(title: params[:title], text: params[:text], user_id: session[:user])
    # Copied from Index
      @login = "<p>Logged in as #{User.where(id: session[:user]).first.name},</p><p><a href='/submit'>Create new post</a></p>"
      @posts = Post.all
      @counter = 0
    erb :index
    # Copied from Index
  else
    erb :login
  end
end