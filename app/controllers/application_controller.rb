class ApplicationController < Sinatra::Base
  register Sinatra::StaticAssets

  configure do
    set :views, 'app/views'
  end

  get '/' do
    "Hello, World!"
  end
end
