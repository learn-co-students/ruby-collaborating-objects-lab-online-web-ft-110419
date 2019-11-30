class Song
  attr_accessor :artist, :name, :new_by_filename
  
  @@all = []
    
    def initialize(name)
      @name = name
      save
    end
    
     def save
      @@all << self
    end
    
    def self.all
      @@all
    end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end


    def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    a_song = self.new(song)
    a_song.artist_name = artist
    a_song.save
    end
    
  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end
    
    def save
      @@all << self
      self
    end
    
  end