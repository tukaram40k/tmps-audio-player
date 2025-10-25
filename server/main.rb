require 'sinatra'
require_relative 'lib/track'

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  @tracks = Track.all
  erb :index
end
