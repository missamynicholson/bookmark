class W4BookmarkManager < Sinatra::Base
  get '/links/new' do
    erb(:'links/new')
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

  get '/links' do
   @links = Link.all
   erb(:'links/index')
  end
end
