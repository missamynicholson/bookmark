ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'tilt/erb'
require_relative 'data_mapper_setup'


class W4BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
   register Sinatra::Flash

  get '/users/new' do
    erb :'users/new'
  end

  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/users' do
    user = User.create(email: params[:email],
      password: params[:password], password_confirmation: params[:password_confirmation])
    if user.id.nil?
      flash[:errors] = user.errors.full_messages
      flash[:email] = params[:email]
      redirect to('/users/new')
    else
      session[:user_id] = user.id
      redirect to('/links')
    end
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tags = params[:tag].split(", ")
    tags.each do |t|
      tag = Tag.create(tag_name: t)
      link.tags << tag
    end
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(tag_name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
