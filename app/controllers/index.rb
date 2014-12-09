# Pseudocode
  # get '/' do
  # get '/category/:id'
  # get '/article/:id'
  # get '/article/:id/edit'
  # put '/article/:id'
  # post '/article'
  # delete '/article/:id'

get '/' do
  @articles = Article.last(10)
  @categories = Category.all

  erb :view
end

get '/category/:id' do
  @articles = Article.find_by(category_id: params[:id])
  @categories = Category.all

  erb :view
end

get 'article/new' do
  @categories = Category.all
  @articles = nil

  erb :edit
end

get '/article/:id' do
  @articles = Article.find(params[:id])
  @categories = Category.all

  erb :view
end

get '/article/:id/edit' do
  @articles = Article.find(params[:id])
  @categories = Category.all

  erb :edit
end

put '/article/:id' do
  @articles = Article.find(params[:id])
  @articles.title = params[:title]
  @articles.name = params[:name]
  @articles.price = params[:price]
  @articles.email = params[:email]
  @articles.address = params[:address]
  @articles.body = params[:body]
  @articles.save

  redirect '/article/#{params[:id]}'
end

post '/article' do
  @articles = Article.find(params[:id])
  @articles.title = params[:title]
  @articles.name = params[:name]
  @articles.price = params[:price]
  @articles.email = params[:email]
  @articles.address = params[:address]
  @articles.body = params[:body]
  @articles.save

  redirect '/article/#{params[:id]}'
end

delete '/article/:id' do
  @articles = Article.find(params[:id])
  @articles.destroy

  redirect '/'
end
