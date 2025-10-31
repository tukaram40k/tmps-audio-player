require_relative '../track'

class PodcastTrack < Track
  def initialize
    super
    @track_type = 'Podcast'
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
end