# frozen_string_literal: true

require 'dotenv/load'
require_relative 'app/helpers/application_helper'
require_relative 'config/environment.rb'

use Rack::MethodOverride
use RecipesController

run ApplicationController
