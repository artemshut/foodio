require 'bundler'
require 'bundler/setup'
require 'sinatra/static_assets'
require 'sinatra/twitter-bootstrap'
require 'haml'
require 'sinatra/paginate'

Bundler.require
require_all 'app'
