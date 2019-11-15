
class Artist 
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self 
  end
  
  def songs 
    Song.all.select {|song| song.artist == self}
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def print_songs
    self.songs.each {|song| puts song.name}
  end
  
  def self.find_or_create_by_name(artist_name)
    artist_exists = @@all.find {|artist| artist.name == artist_name}
    !artist_exists ? Artist.new(artist_name) : artist_exists
  end
  
  def self.all 
    @@all
  end


end