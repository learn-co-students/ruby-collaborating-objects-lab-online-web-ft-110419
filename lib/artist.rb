class Artist 
  attr_accessor :name, :songs 
  @@all = []
  
  def initialize(name) 
    @name = name 
    @songs = [] 
    self.class.all << self
  end
  
  def songs 
    Song.all.select {|song| song.artist == self} 
  end 
  
  def self.all  # class method returns all instances of Artist class
    @@all
  end 
  
  def self.find_or_create_by_name(name)
    self.all.detect {|artist| artist.name == name} || Artist.new(name)
  end
  
  def add_song(song) 
    # self.songs << song # Artist.songs reader returns all
    song.artist = self 
  end 
  
  def print_songs
    self.songs.each {|song| puts song.name}
  end 
end 