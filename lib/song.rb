require "pry"

class Song 
    attr_accessor :name, :artist, :genre
    
    @@all = []
    
    def initialize(title)
      @name = title
      @@all << self
    end
    
    def artist=(name)
      @artist = name
    end
    
    def artist() 
      @artist
    end

    def genre=(type)
      @genre = type
    end
  
    def artist_name()
      if artist 
          return artist.name 
      end 
  end
    
    def self.all 
      @@all 
    end

    def self.new_by_filename(file_name)
      artist, title, genre = file_name.split("-")
   
      song = Song.new(title)
      @genre = genre[0..-5].strip
      @artist = artist.strip
      @name = title.strip
      binding.pry
      song
    end
  
  end