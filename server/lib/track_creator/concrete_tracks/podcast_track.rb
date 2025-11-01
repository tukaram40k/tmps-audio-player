require_relative '../track'
require 'json'

class PodcastTrack < Track
  def initialize
    super
    @track_type = 'Podcast'
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

  def to_s
    super
  end

  def to_h
    {
      id: @core_data.id,
      title: @core_data.title,
      duration: @core_data.duration,
      file_format: @core_data.file_format,
      filename: @core_data.filename,
      track_type: @track_type,
      url: @core_data.url,
      artist: @content_data.artist,
      producer: @content_data.producer,
      album: @content_data.album,
      genres: @content_data.genres,
      tags: @content_data.tags,
      language: @content_data.language,
      bit_rate: @technical_data.bit_rate,
      bit_depth: @technical_data.bit_depth,
      audio_channels: @technical_data.audio_channels
    }
  end

  def to_json(*_args)
    to_h.to_json
  end
end