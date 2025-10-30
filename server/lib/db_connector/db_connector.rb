# db connector singleton

class DBConnector
  attr_accessor :audio_files_path

  @instance = nil

  private_class_method :new

  def self.create
    @instance ||= new
  end

  def initialize
    @audio_files_path = File.expand_path('../../public/audio_files', File.dirname(__FILE__))
  end

  # add track pool class later
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
end

a = DBConnector.create
puts a.list_audio_files