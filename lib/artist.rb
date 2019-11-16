class Artist
    attr_accessor :name, :artist_name
    
    @@all = []
    
    def initialize(name)
      @name = name
      @@all << self
    end
    
    def self.all 
      @@all
    end

    def artist_name=(name)
      @artist_name = name
    end
    
    def add_song(song)
      song.artist = self
    end
    
    def add_song_by_name(name)
      new_song = Song.new(name)
      new_song.artist = self
    end

    def self.find_or_create_by_name(name)
        is_artist = self.all.find {|artist| artist.name == name}
        if is_artist.nil?
           artist = Artist.new(name)
        else
            is_artist
        end
    end
    
    def print_songs
        artist_songs = Song.all.select {|song| song.artist == self}
        song_titles = artist_songs.map {|song| puts song.name}
      end
    
    def songs 
      Song.all.select {|song| song.artist == self}
    end
  
    def self.song_count 
      Song.all.length
    end
  end