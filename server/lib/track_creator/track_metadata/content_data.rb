class ContentData
  attr_accessor :artist, :producer, :album,
                :genres, :tags, :language

  def to_s
    "artist: #{@artist}\nproducer: #{@producer}\nalbum: #{@album}\ngenres: #{@genres}\ntags: #{@tags}\nlanguage: #{@language}"
  end
end