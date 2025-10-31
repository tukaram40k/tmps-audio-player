class Playlist
  attr_accessor :id, :name, :creator, :description,
                :privacy_settings, :creation_date,
                :allowed_order, :dynamic, :type, :persistent,
                :tracks

  def initialize
    @order = []
    @dynamic = false
    @persistent = true
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

  def set_creation_date
    @creation_date = Time.now
  end

  def set_allowed_order(order_list)
    order_list.each do |order|
      @allowed_order << order
    end
  end

  def set_dynamic(val)
    @dynamic = val
  end

  def set_persistent(val)
    @persistent = val
  end

  def set_type(type)
    @type = type
  end

  def set_tracks(tracks)
    tracks.each do |track|
      @tracks << track
    end
  end

  def to_s
    "=======================\n" +
    "id: #{@id}\nname: #{@name}\ncreator: #{@creator}\ndescription: #{@description}\n" +
    "privacy_settings: #{@privacy_settings}\ncreation_date: #{@creation_date}\n" +
    "type: #{@type}\ntracks: #{@tracks}\n"
  end
end