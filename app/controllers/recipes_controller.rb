# frozen_string_literal: true

class RecipesController < ApplicationController
  RECIPE_CONTENT_TYPE = 'recipe'

  layout :layout

  get '/recipes' do
    @recipes = contentful_client.entries(content_type: RECIPE_CONTENT_TYPE)
    haml :'recipes/index'

  rescue Exception => e
    haml :error
  end

  get '/recipes/:id' do
    @recipe = contentful_client.entry(params[:id])
    return haml :'recipes/not_found' if @recipe.nil?
    
    haml :'recipes/show'

  rescue Exception => e
    haml :error
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
