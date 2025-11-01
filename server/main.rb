require_relative 'lib/initializers/track_initializer'
require_relative 'lib/initializers/playlist_initializer'

track_initializer = TrackInitializer.new
track_list = track_initializer.build_tracks

playlist_initializer = PlaylistInitializer.new
playlists = playlist_initializer.build_playlists

e = JSON.parse(track_initializer.to_json(track_list))
puts JSON.pretty_generate(e)

# puts "tracks: "
# puts track_list
#
# puts "\n\nplaylists: "
# puts playlists