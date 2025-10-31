require_relative 'playlist_builder'

class PlaylistDirector
  attr_accessor :playlist_builder

  def initialize(builder)
    @playlist_builder = builder
  end

  def build_playlist(hash)
    @playlist_builder.reset
    @playlist_builder.set_id(hash['id'])
    @playlist_builder.set_metadata(hash['name'], hash['creator'], hash['description'])
    @playlist_builder.set_system_settings(hash['privacy_settings'])
    @playlist_builder.set_tracks(hash['tracks'])
    @playlist_builder.playlist
  end
end