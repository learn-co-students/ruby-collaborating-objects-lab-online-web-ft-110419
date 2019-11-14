require 'pry'
# binding.pry
class Artist 
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def songs 
    Song.all.select {|song| song.artist == self}
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def self.find_or_create_by_name(name)
    finding_artist = self.all.find {|artist| artist.name == name}
    if finding_artist.nil?
       artist = Artist.new(name)
    else
        finding_artist
    end
  end
  
  def print_songs
    artist_songs = Song.all.select {|song| song.artist == self}
    song_titles = artist_songs.map {|song| puts song.name}
  end
  
end