# builder interface

class PlaylistBuilder
  def reset
    raise NotImplementedError
  end

  def playlist
    raise NotImplementedError
  end

  def set_id(id)
    raise NotImplementedError
  end

  def set_metadata(name, creator, description)
    raise NotImplementedError
  end

  def set_system_settings(privacy_settings)
    raise NotImplementedError
  end

  def set_tracks(tracks)
    raise NotImplementedError
  end
end