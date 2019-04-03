
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :all_articles
  end

  get '/articles/new' do
    erb :create_article
  end

  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :article_page
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit_article
  end

  patch '/articles/:id/edit' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id/delete' do
    Article.delete(params[:id])
    redirect to "/articles"
  end

end
