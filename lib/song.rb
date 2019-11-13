#When you create a new song, add it to the artist's song array
class Song 
  attr_accessor :name
  attr_reader :artist
  @@all = []
  def initialize(name) 
    @name = name
    @@all << self
  end
  
  def artist=(artist)
    @artist = artist
    @artist.songs << self
  end
  
  def self.new_by_filename(filename)
    #read data out of the filename
    filename_array = filename.chomp(".mp3").split(" - ")
    song_artist = filename_array[0]
    song_title = filename_array[1]
    song_genre = filename_array[2]
    #make a new song
    new_song = Song.new(song_title)
    new_song.artist = Artist.find_or_create_by_name(song_artist)
    new_song
  end
      
  def artist_name=(name)
    #look for an artist with name name in @@all
    in_all = false
    @@all.each do |song|
      if song.artist 
        if song.artist.name == name
          #if you find an artist that matches the name, assign that artist to the song
          self.artist = song.artist
          in_all = true
        end
      end 
    end
    #If you don't find a matching artist, create one and assign it to the song
    if in_all == false
      artist = Artist.new(name)
      self.artist = artist
    end
    #the return value is always the input (name)
  end

  def self.all 
    @@all 
  end 
end

