require 'sinatra'
require 'sinatra/json'
require 'sinatra/config_file'
require 'json'
require 'atpruby'

require_relative 'atpserver/atpruby-extension'
require_relative 'atpserver/match_routes'
require_relative 'atpserver/player_routes'

config_file 'config.yml'