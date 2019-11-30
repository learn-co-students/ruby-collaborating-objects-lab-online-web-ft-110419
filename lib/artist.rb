  require 'pry'
  
  class Artist
    @@all = []
    attr_accessor :name, :songs
    
    def initialize(name)
      @name = name
      save
    end
    
    def self.all
      @@all
    end
    
    def add_song(song)
      song.artist = self
    end
    
    def add_song_by_name(name)
      song = Song.new(name)
      song.artist = self
    end
    
    def songs
     Song.all.select {|song| song.artist == self}
    end
   
    def self.find_or_create_by_name(name)
      self.find(name) || self.new(name)
    end
  
    def self.find(name)
      self.all.find {|artist| artist.name == name }
    end
  
  def save
    @@all << self
  end
  
    def print_songs
      self.songs.each do |song|
      puts song.name
    end
    end 

    
  end