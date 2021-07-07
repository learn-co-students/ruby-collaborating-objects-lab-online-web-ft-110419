class Artist 
  attr_accessor :name 
  @@all = []
  
  def initialize(name)
    @name = name
    @song = []
  end 
   def self.all
    @@all
  end 
  
  def songs 
    @songs
  end 
  
  def add_song(song)
     @songs << song
    song.artist = self
    song
  end  
  
  def self.find_or_create_by_name
  end
  
  def print_songs
  end 
end 