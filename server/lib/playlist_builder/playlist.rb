class Playlist
  attr_accessor :id, :name, :creator, :description,
                :privacy_settings, :creation_date,
                :order, :type, :tracks

  def initialize
    @tracks = []
  end

  def set_id(id)
    @id = id
  end

  def set_name(name)
    @name = name
  end

  def set_creator(creator)
    @creator = creator
  end

  def set_description(description)
    @description = description
  end

  def set_privacy_settings(privacy_settings)
    @privacy_settings = privacy_settings
  end

  def set_creation_date(date)
    @creation_date = date
  end

  def set_order(order)
    @order = order
  end

  def set_type(type)
    @type = type
  end

  def set_tracks(tracks)
    tracks.each { |track|
      @tracks << track
    }
  end
end