#When you create a new song, add it to the artist's song array
class Song 
  attr_accessor :name, :artist
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
    p "I'm in new_by_filename #{new_song.artist_name = song_artist}"
    artist = new_song.artist_name = song_artist
    #find or create artist with the name song_artist and assign that artist to new_song
    #this is a string. WHY?
    new_song.artist = artist
    #return new song
    new_song
  end
  
  # def artist_name=(name)
  #   self.artist = Artist.find_or_create_by_name(name)
  #   artist.add_song(self)
  # end
    
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
    #the method returns an Artist object
    p "This is what artist_name= returns #{self.artist}"
    return self.artist
end

    
    
  def self.all 
    @@all 
  end 
end

