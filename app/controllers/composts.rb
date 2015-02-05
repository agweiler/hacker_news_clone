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