require_relative '../env.rb'

class Song 
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(file_name)
    artist, title, genre = file_name.split("-")
 
    song = Song.new(title.strip)
    song.genre = genre.strip
    song.artist_name = artist.strip
    song
  end
  
  def artist_name=(artist)
    self.artist = Artist.find_or_create_by_name(artist)
    self.artist.add_song(self)
  end
  
end