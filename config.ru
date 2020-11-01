require_relative 'config/environment.rb'
use Rack::MethodOverride
use RecipesController
# use ControllerOfUrApp
# use OtherController
run ApplicationController
