class Song 
    attr_accessor :name, :artist, :genre
    
    @@all = []
    
    def initialize(title)
      @name = title
      @@all << self
    end

    def genre=(type)
      @genre = type
    end
  
    def artist_name()
      if artist 
          return artist.name 
      end 
  end

    def artist_name=(name)
      art = Artist.find_or_create_by_name(name)
      art.add_song(self)
    end
    
    def self.all 
      @@all 
    end

    def self.new_by_filename(file_name)
      artist, title, genre = file_name.split("-")
   
      song = Song.new(title)
      song.genre = genre.strip![0..-5]
      song.artist = Artist.new(artist.strip!)
      song.name = title.strip!
      song
    end
  
  end