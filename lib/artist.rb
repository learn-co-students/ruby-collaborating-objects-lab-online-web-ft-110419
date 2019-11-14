require 'pry'
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
    artist? = self.all.select {|artist| artist.name == name}.empty?
    binding.pry
    #   artist = Artist.new(name)
    # end
    # self.all.select {|artist| artist.name == name}
  end
  
  
end