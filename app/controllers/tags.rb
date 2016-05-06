class W4BookmarkManager < Sinatra::Base

    get '/tags/:name' do
      tag = Tag.first(tag_name: params[:name])
      @links = tag ? tag.links : []
      erb :'links/index'
    end
end
