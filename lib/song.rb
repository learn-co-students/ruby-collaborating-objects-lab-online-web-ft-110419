class Song
  attr_accessor :name, :artist
@@all = []
  def initialize(name)
    @name=name
    @@all << self
  end
  def self.all
    @@all
  end
  def self.new_by_filename(file)
    file_array = file.split("-")
  file = Song.new(file)
  file.artist.name = file_array[0]
  end

end
