# db connector singleton

require 'json'

class DBConnector
  attr_accessor :audio_files_path, :audio_files_list,
                :audio_files_json, :audio_files_hash,
                :playlists_json, :playlists_hash

  @instance = nil

  private_class_method :new

  def self.create
    @instance ||= new
  end

  def initialize
    @audio_files_path = File.expand_path('../../public/audio_files', File.dirname(__FILE__))
    @audio_files_json = File.expand_path('../../db/audio_files.json', File.dirname(__FILE__))
    @playlists_json = File.expand_path('../../db/playlists.json', File.dirname(__FILE__))
  end

  def load_audio_files
    @audio_files_hash = JSON.parse(File.read(@audio_files_json))
    @audio_files_list = list_audio_files
  end

  def load_playlists
    @playlists_hash = JSON.parse(File.read(@playlists_json))
  end

  # lists track names
  def list_audio_files
    audio_files_list = []

    if Dir.exist?(@audio_files_path)
      if (Dir.entries(@audio_files_path) - %w[. ..]).empty?
        raise 'Audio files folder is empty'
      else
        Dir.foreach(@audio_files_path) do |file|
          audio_files_list << file
        end
      end
    else
      raise 'Invalid path to audio files'
    end
    audio_files_list - %w[. ..]
  end

  def validate_audio_files
    filenames = @audio_files_list.map do |file|
      File.basename(file, File.extname(file))
    end

    @audio_files_hash.each do |track|
      unless filenames.include?(track['filename'])
        raise "no such file #{track['filename']}"
      end
    end
  end
end

# a = DBConnector.create
# a.load_audio_files
# puts a.audio_files_list
# puts a.audio_files_hash
# a.validate_audio_files