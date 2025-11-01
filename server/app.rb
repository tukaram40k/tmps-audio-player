require 'sinatra'
require_relative 'lib/initializers/track_initializer'
require_relative 'lib/initializers/playlist_initializer'
require_relative 'controllers/audio_files_request_controller'

track_initializer = TrackInitializer.new
track_list = track_initializer.build_tracks
tracks_hash = track_initializer.to_h(track_list)

playlist_initializer = PlaylistInitializer.new
playlists = playlist_initializer.build_playlists

# set :public_folder, File.dirname(__FILE__) + '/public'

before do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Content-Type'
end

options '*' do
  200
end

get '/tracks' do
  content_type :json
  controller = AudioFilesRequestController.new(request)
  controller.prepare_tracks(tracks_hash)
end
