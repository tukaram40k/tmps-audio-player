class AudioFilesRequestController
  def initialize(request)
    @request = request
  end

  def prepare_tracks(tracks_hash)
    full_tracks = tracks_hash.map do |track|
      url = track[:url] || track["url"]
      track.merge(
        url: "#{@request.base_url}#{url.sub(%r{^#{Dir.pwd}/public}, '')}"
      )
    end

    full_tracks.to_json
  end

  def prepare_playlists(playlists_hash)
    playlists_hash.to_json
  end
end