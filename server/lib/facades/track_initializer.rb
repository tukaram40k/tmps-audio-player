require_relative '../db_connector/db_connector'
require_relative '../track_creator/concrete_creators/standard_track_creator'
require_relative '../track_creator/concrete_creators/audiobook_track_creator'
require_relative '../track_creator/concrete_creators/podcast_track_creator'
require 'json'

class TrackInitializer
  attr_accessor :audio_files_list, :audio_files_hash

  def initialize
    db_connector = DBConnector.create
    db_connector.load_audio_files
    db_connector.validate_audio_files

    @audio_files_list = db_connector.audio_files_list
    audio_files_hash = db_connector.audio_files_hash

    audio_files_hash.each do |hash|
      hash['url'] = db_connector.audio_files_path + '/' + hash['filename'] + hash['file_format']
    end

    @audio_files_hash = audio_files_hash
  end

  # returns array of track objects
  def build_tracks
    tracks = []
    standard_creator = StandardTrackCreator.new
    audiobook_creator = AudiobookTrackCreator.new
    podcast_creator = PodcastTrackCreator.new

    @audio_files_hash.each do |hash|
      case hash['track_type']
      when 'standard'
        new_track = standard_creator.create_track(hash)
      when 'audiobook'
        new_track = audiobook_creator.create_track(hash)
      when 'podcast'
        new_track = podcast_creator.create_track(hash)
      else
        raise "Invalid track type in track #{hash}"
      end
      tracks << new_track
    end

    tracks
  end

  def to_h(tracks, *_args)
    tracks.map(&:to_h)
  end

  def to_json(tracks, *_args)
    tracks.map(&:to_h).to_json
  end
end

# a = TrackInitializer.new
# puts a.build_tracks