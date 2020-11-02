class ApplicationController < Sinatra::Base
  include ApplicationHelper
  register Sinatra::StaticAssets
  register Sinatra::Twitter::Bootstrap::Assets
  register Sinatra::Paginate

  configure do
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end
end
