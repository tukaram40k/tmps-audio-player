require_relative 'track_metadata/core_data'
require_relative 'track_metadata/content_data'
require_relative 'track_metadata/technical_data'

class Track
  attr_accessor :track_type, :core_data, :content_data, :technical_data

  def initialize
    @core_data = CoreData.new
    @content_data = ContentData.new
    @technical_data = TechnicalData.new
  end

  def set_core_data(id, title, duration, file_format, filename, url)
    @core_data.id = id
    @core_data.title = title
    @core_data.duration = duration
    @core_data.file_format = file_format
    @core_data.filename = filename
    @core_data.url = url
  end

  def set_content_data(artist, producer, album, genres, tags, language)
    @content_data.artist = artist
    @content_data.producer = producer
    @content_data.album = album
    @content_data.genres = genres
    @content_data.tags = tags
    @content_data.language = language
  end

  def set_technical_data(bit_rate, bit_depth, audio_channels)
    @technical_data.bit_rate = bit_rate
    @technical_data.bit_depth = bit_depth
    @technical_data.audio_channels = audio_channels
  end

  def set_special_data
    raise NotImplementedError
  end

  def to_s
    "=======================\n" +
    "#{@core_data}#{@content_data}#{@technical_data}\n"
  end
end
