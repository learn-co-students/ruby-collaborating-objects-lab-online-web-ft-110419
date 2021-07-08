class Song
  
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song.save
    new_song
  end
  
  def self.find_by_artist(artist)
    Song.all.select{|song| song.artist == artist}
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    #binding.pry
  end
  
  def save
    @@all << self
  end
  
end