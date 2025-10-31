require_relative '../track'

class AudiobookTrack < Track
  attr_accessor :narrator

  def initialize
    super
    @track_type = 'Audiobook'
  end

  def set_core_data(id, title, duration, file_format, url)
    super
  end

  def set_content_data(artist, producer, album, genres, tags, language)
    super
  end

  def set_technical_data(bit_rate, bit_depth, audio_channels)
    super
  end

  def set_special_data(narrator)
    @narrator = narrator
  end

  def to_s
    super
  end
end