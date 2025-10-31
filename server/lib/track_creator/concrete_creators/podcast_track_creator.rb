require_relative '../track_creator'
require_relative '../concrete_tracks/podcast_track'

class PodcastTrackCreator < TrackCreator
  attr_accessor :track

  def create_track(hash)
    @track = PodcastTrack.new

    @track.set_core_data(
      hash['id'],
      hash['title'],
      hash['duration'],
      hash['file_format'],
      hash['filename'],
      hash['url']
    )

    @track.set_content_data(
      hash['artist'],
      hash['producer'],
      hash['album'],
      hash['genres'],
      hash['tags'],
      hash['language']
    )

    @track.set_technical_data(
      hash['bit_rate'],
      hash['bit_depth'],
      hash['audio_channels']
    )

    @track
  end
end