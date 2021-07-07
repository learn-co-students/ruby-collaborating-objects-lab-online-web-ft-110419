require 'pry'
class Artist

    @@all = [] # Contains all instances of Artist

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name) # name will be string
        if all.any? { |artist| artist.name == name } 
            all.find { |artist| artist.name == name } 
        else
            Artist.new(name)
        end
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select { |song| song.artist == self ? self : nil }
    end

    def print_songs
        songs.each { |song| puts song.name }
    end


end