class RecipesController < ApplicationController
  layout :layout

  Struct.new('Result', :total, :size, :recipes)

  get '/recipes' do
    @recipes = contentful_client.entries(content_type: 'recipe')
    @result = Struct::Result.new(@recipes.total, 2, @recipes)
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
