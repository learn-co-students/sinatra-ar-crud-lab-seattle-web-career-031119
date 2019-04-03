
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit
  end

  post '/articles' do
    article = Article.create(params)
    id = article.id

    redirect "/articles/#{id}"
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])
    title = params[:title]
    content = params[:content]
    article.update(title: title, content: content)
    id = article.id

    redirect "/articles/#{id}"
  end

  delete '/articles/:id' do
    article = Article.find(params[:id])
    article.delete
    redirect "/articles"
  end



end



# Magazine App
#   Create Action
#     creates a new article (FAILED - 1)
#     redirects to '/articles/:id' (FAILED - 2)
#   Read Action
#     index action
#       responds with a 200 status code
#       displays all the articles (FAILED - 3)
#     show action
#       show page responds with a 200 status code (FAILED - 4)
#       show page displays the article's title (FAILED - 5)
#       show page displays the article's content (FAILED - 6)
#   update action
#     responds with a 200 status code (FAILED - 7)
#     displays the existing object in the edit form (FAILED - 8)
#     saves edits to an article (FAILED - 9)
#     redirects to '/articles/:id' (FAILED - 10)
#     submits the form via a patch request (FAILED - 11)
#   delete action
#     responds with a 200 status code (FAILED - 12)
#     deletes an article from the database (FAILED - 13)
#     submits the form via a delete request (FAILED - 14)
#
