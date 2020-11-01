module ApplicationHelper
  def chef_name(recipe)
    recipe.fields[:chef]&.fields&.fetch(:name, 'Chef name is unavailable')
  end
end
