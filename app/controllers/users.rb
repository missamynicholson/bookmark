class W4BookmarkManager < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.id.nil?
      flash[:errors] = user.errors.full_messages
      flash[:email] = params[:email]
      redirect to('/users/new')
    else
      session[:user_id] = user.id
      redirect to('/links')
    end
  end

  get '/users/signin' do
    erb :'users/signin'
  end

  post '/users/signin' do
    user = User.authenticate(params[:email], params[:password])
    if !user.nil?
      session[:user_id] = user.id
      redirect to('/links')
    else
      flash[:errors] = ["Incorrect email and password combination"]
      flash[:email] = params[:email]
      redirect to('/users/signin')
    end
  end

  post '/users/signout' do
   session[:user_id] = nil
   flash[:goodbye] = "Good bye"
   redirect to ('/links')
  end

  get '/users/password_recovery' do
    erb :'users/password_recovery'
  end

  post '/users/recovery' do
    flash[:message] = "Check your emails"
    user = User.first(:email params[:email])
    user.generate_token
    redirect to '/users/recovery'
  end

  get '/users/recovery' do
    erb :'users/recovery'
  end
end
