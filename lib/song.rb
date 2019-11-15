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
  
  def self.new_by_filename(file_name)
    song_title = file_name.split('-')[1].strip
    song_artist = file_name.split('-').first.strip
    song = Song.new(song_title)
    song.artist_name = song_artist
    song
  end
  
  def artist_name=(artist)
    self.artist = Artist.find_or_create_by_name(artist)
    self.artist.add_song(self)
  end
  
end