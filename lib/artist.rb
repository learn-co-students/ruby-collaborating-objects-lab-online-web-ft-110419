require 'pry'
class Artist
      attr_accessor :name
      @@all = []
      def initialize(name)
       @name = name
      @@all  << self
      
      #binding.pry
      end
     
      def self.all
       @@all
       
       #binding.pry
     end
     
     def songs
        Song.all.select {|song| song.artist == self }
     end
     
      def add_song(song_one)
          song_one.artist = self
      end
      
      def self.find_or_create_by_name(name)
        artist = self.all.detect {|artist| artist.name == name}
        artist ||= self.new(name)
        artist
      end
     
     def print_songs
        songs.each {|song| puts song.name}
     end
     
        
end