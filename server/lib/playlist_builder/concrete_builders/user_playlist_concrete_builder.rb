require_relative '../playlist_builder'
require_relative '../playlist'

class UserPlaylistConcreteBuilder < PlaylistBuilder
  attr_accessor :user_playlist

  def initialize
    reset
  end

  def reset
    @user_playlist = Playlist.new
  end

  def playlist
    user_playlist = @user_playlist
    reset
    user_playlist
  end

  def set_id(id)
    @user_playlist.set_id(id)
  end

  def set_metadata(name, creator, description)
    @user_playlist.set_name(name)
    @user_playlist.set_creator(creator)
    @user_playlist.set_description(description)
    @user_playlist.set_creation_date
  end

  def set_system_settings(privacy_settings)
    @user_playlist.set_privacy_settings(privacy_settings)
    # @user_playlist.set_allowed_order(%w[regular mixed smart custom])
    @user_playlist.set_type('user-custom-playlist')
  end

  def set_tracks(tracks)
    @user_playlist.set_tracks(tracks)
  end
end