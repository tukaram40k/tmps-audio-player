require_relative '../track'

class StandardTrackCreator < TrackCreator
  attr_accessor :track

  def factory_method
    @track = StandardTrack.new

  end
end