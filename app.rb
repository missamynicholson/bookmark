require 'sinatra/base'
require './models/link'

class Bookmark < Sinatra::Base
  get '/links' do
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
