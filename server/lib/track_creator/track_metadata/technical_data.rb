class TechnicalData
  attr_accessor :bit_rate, :bit_depth, :audio_channels

  def to_s
    "bit rate: #{@bit_rate}\nbit depth: #{@bit_depth}\naudio channels: #{@audio_channels}"
  end
end