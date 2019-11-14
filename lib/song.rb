class Song 
  attr_accessor :name, :artist
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(file_name)
    song_title = file_name.split('-')[1]
    song_artist = file_name.split('-').first
    song = Song.new(song_title)
    binding.pry
    artist = Artist.all.find {|artist| artist.name == song_artist}
    
  end
  
  def artist_name=(artist)
    @artist_name = artist
  end
  
  def artist_name
    @artist_name
  end
  
end