require 'faker'

get '/' do #DONE
  @articles = Article.last(10)
  @categories = Category.all

  erb :view
end

get '/category/:id' do #DONE

  p @articles = Article.where(category_id: params[:id])
  @categories = Category.all

  erb :view
end

get '/article/new' do
  @categories = Category.all
  @articles = nil

  erb :edit
end

get '/article/:id' do
  @articles = Article.where(id: params[:id])
  @categories = Category.all

  erb :view
end

get '/article/:id/edit' do
  @articles = Article.find(params[:id])
  @categories = Category.all

  erb :edit
end

get '/random_article' do
  @articles = Article.create(title: Faker::Company.bs, name: Faker::Name.name, category: Category.find_or_create_by(name: Faker::Commerce.department), price: Faker::Number.number(2).to_i, address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state_abbr}", email: Faker::Internet.email('Nancy'), body: Faker::Lorem.paragraph(rand(1..4)))
  @categories = Category.all
  redirect "/article/#{@articles.id}"
end

put '/article/:id' do #DONE
  new_article = Article.find(params[:id])
  new_article.title = params[:title]
  new_article.name = params[:name]
  new_article.price = params[:price].to_i
  new_article.email = params[:email]
  new_article.address = params[:address]
  new_article.body = params[:body]
  new_article.category = Category.find_or_create_by(name: params[:category])
  new_article.save

  redirect "/article/#{new_article.id}"
end

post '/article' do #DONE
  @articles = Article.create
  @articles.title = params[:title]
  @articles.name = params[:name]
  @articles.price = params[:price].to_i
  @articles.email = params[:email]
  @articles.address = params[:address]
  @articles.body = params[:body]
  @articles.category = Category.find_or_create_by(name: params[:category])
  @articles.save

  redirect "/article/#{@articles.id}"
end

delete '/article/:id' do #DONE
  @articles = Article.find(params[:id])
  @articles.destroy

  redirect '/'
end
