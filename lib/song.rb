require 'pry'
class Song
  
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self
  end
  
  def artist_name=(name)
    @artist = Artist.find_or_create_by_name(name)
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(filename)
    file_string = filename.split(" - ")
    artist_name = file_string[0]
    song_name = file_string[1]
    new_song = Song.new(song_name)
    new_song.artist_name = artist_name
    new_song
  end
  
end