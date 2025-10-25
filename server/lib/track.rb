class Track
  attr_reader :name, :file_path, :url

  def initialize(filename, base_url = '/audio_files')
    @name = File.basename(filename, '.mp3')
    @file_path = File.join('public', 'audio_files', filename)
    @url = File.join(base_url, filename)
  end

  def self.all
    music_dir = File.join('public', 'audio_files')
    Dir.entries(music_dir)
       .select { |f| f.end_with?('.mp3') }
       .sort
       .map { |f| Track.new(f) }
  end
end
