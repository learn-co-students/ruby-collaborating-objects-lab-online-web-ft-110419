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
  
  def artist_name=(artist)
    #accept artist name -- find_or_create_by_name
    #associate new song instance with artist from filename 
    self.artist = Artist.find_or_create_by_name(artist)
    #artist.add_song(self)
  end 
  
  def self.new_by_filename(file_name)
    artist = file_name.split(" - ")[0]
    song = file_name.split(" - ")[1]
    song = Song.new(song)
    song.artist_name = artist 
    song  
  end 
  
end 