# builder interface

class PlaylistBuilder
  def set_id
    raise NotImplementedError
  end

  def set_name
    raise NotImplementedError
  end

  def set_creator
    raise NotImplementedError
  end

  def set_description
    raise NotImplementedError
  end

  def set_privacy_settings
    raise NotImplementedError
  end

  def set_creation_date
    raise NotImplementedError
  end

  def set_order
    raise NotImplementedError
  end

  def set_playlist_type
    raise NotImplementedError
  end

  def set_tracks
    raise NotImplementedError
  end
end