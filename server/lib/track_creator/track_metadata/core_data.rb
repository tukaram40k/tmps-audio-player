class CoreData
  attr_accessor :id, :title, :duration,
                :file_format, :url

  def to_s
    "id: #{@id}\ntitle: #{@title}\nduration: #{@duration}\nfile_format: #{@file_format}\nurl: #{@url}\n"
  end
end