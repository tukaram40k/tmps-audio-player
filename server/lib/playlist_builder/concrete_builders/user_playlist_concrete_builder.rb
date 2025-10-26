require_relative '../playlist_builder'
require_relative '../playlist'

class UserPlaylistConcreteBuilder < PlaylistBuilder
  attr_accessor :user_playlist

  def initialize
    @user_playlist = Playlist.new
  end

  def set_id(id)
    @user_playlist.set_id(id)
  end

  def set_name(name)
    @user_playlist.set_name(name)
  end

  def set_creator(creator)
    @user_playlist.set_creator(creator)
  end

  def set_description(description)
    @user_playlist.set_description(description)
  end

  def set_privacy_settings(privacy_settings)
    @user_playlist.set_privacy_settings(privacy_settings)
  end

  def set_creation_date
    @user_playlist.set_creation_date(Time.now)
  end

  def set_order
    @user_playlist.set_order('regular')
  end

  def set_playlist_type
    @user_playlist.set_type('user-made')
  end

  def set_tracks(tracks)
    @user_playlist.set_tracks(tracks)
  end
end