require 'pry'

class Artist
  
  attr_accessor :name
  
  #an array to holds all artists
  @@all = []
  
  #initializes a name upon the creation of a new artist
  def initialize(name)
    @name = name
    save
  end
  
  #returns an array of all the artist
  def self.all
    @@all
  end
  
  #saves each instance of an artist to an class variable
  def save
    @@all << self
  end
  
  #assigns artist to song
  def add_song(song)
    song.artist = self
  end
    
  #compares the artist name in songs and the current instance to find songs by artist
  def songs
    Song.all.select{|song| song.artist == self}
  end
  
  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.new(name)
  end
  
  # returns existing artist name as a string
  def self.find(name)
    self.all.find{|artist| artist.name == name}
  end
    
  def print_songs
    songs.each{|song| puts song.name}
  end
  
end