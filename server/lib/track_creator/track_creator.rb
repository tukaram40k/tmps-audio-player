class TrackCreator
  attr_accessor :audio_files_list, :audio_files_hash

  def factory_method
    raise NotImplementedError
  end

  def initialize(audio_files_list, audio_files_hash)
    @audio_files_list = audio_files_list
    @audio_files_hash = audio_files_hash
  end

  def create_all_tracks
    puts @audio_files_list
  end
end
