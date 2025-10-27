require_relative '../playlist_builder'
require_relative '../playlist'

class ArtistPlaylistConcreteBuilder < PlaylistBuilder
  attr_accessor :artist_playlist

  def initialize
    @artist_playlist = Playlist.new
  end

  def reset
    @artist_playlist = Playlist.new
  end

  def playlist
    artist_playlist = @system_playlist
    reset
    artist_playlist
  end

  def set_id(id)
    @artist_playlist.set_id(id)
  end

  def set_metadata(name, creator, description)
    @artist_playlist.set_name(name)
    @artist_playlist.set_creator(creator)
    @artist_playlist.set_description(description)
    @artist_playlist.set_creation_date
  end

  def set_system_settings(privacy_settings)
    @artist_playlist.set_privacy_settings(privacy_settings)
    @artist_playlist.set_allowed_order(%w[regular mixed])
    @artist_playlist.set_type('artist-album')
  end

  def set_tracks(tracks)
    @artist_playlist.set_tracks(tracks)
  end
end