class RecipesController < ApplicationController
  layout :layout

  get '/recipes' do
    space_id = 'kk2bw5ojx476'
    access_token = '7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c'
    client = Contentful::Client.new(space: space_id, access_token: access_token)
    @recipes = client.entries(content_type: 'recipe')
    erb :'recipes/index'
  end

  get '/recipes/:id' do
    space_id = 'kk2bw5ojx476'
    access_token = '7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c'
    client = Contentful::Client.new(space: space_id, access_token: access_token)
    @recipe = client.entry(params[:id])
    erb :'recipes/show'
  end
end
