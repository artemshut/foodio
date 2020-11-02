class RecipesController < ApplicationController
  layout :layout

  get '/recipes' do
    @recipes = contentful_client.entries(content_type: 'recipe')
    haml :'recipes/index'
  end

  get '/recipes/:id' do
    @recipe = contentful_client.entry(params[:id])
    haml :'recipes/show'
  end

  helpers do
    def contentful_client
      @contentful_client ||= Contentful::Client.new(
        space: ENV['CONTENTFUL_SPACE_ID'],
        access_token: ENV['CONTENTFUL_ACCESS_TOKEN']
      )
    end
  end
end
