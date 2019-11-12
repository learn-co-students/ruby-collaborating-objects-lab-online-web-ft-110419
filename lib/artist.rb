class Artist 
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name 
    @songs = []
    @@all << self 
  end 
  
  def songs 
    @songs 
  end 
  
  def add_song(song)
    song.artist = self
  end 
  
  def print_songs 
    @songs.each{|song| puts song.name}
  end
  
  def self.find_or_create_by_name(name)
    found = @@all.find{|artist| artist.name == name}
    if found
      return found
    end
    if found == nil 
      new_artist = Artist.new(name)
      return new_artist
    end 
  end
  
  def self.all 
    @@all 
  end 
end 

p Artist.find_or_create_by_name("Janet Jackson")
p Artist.find_or_create_by_name("Janet Jackson")
    