require_relative '../track'

class StandardTrack < Track
  attr_accessor :album, :lyrics, :release_date

  def initialize
    super
    @track_type = 'Standard'
  end

  def set_core_data(id, title, duration, file_format, filename, url)
    super
  end

  def set_content_data(artist, producer, album, genres, tags, language)
    super
  end

  def set_technical_data(bit_rate, bit_depth, audio_channels)
    super
  end

  def set_special_data(lyrics, release_date)
    @lyrics = lyrics
    @release_date = release_date
  end

  def to_s
    super
  end
end