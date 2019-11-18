require './lib/song.rb'
require 'pry'

class Artist 
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def songs
    @songs = Song.all.select { |title| title.artist == self }
  end
  
  def add_song(song)
    #refactor Has/Many
    song.artist = self
  end
  
  def self.all
    @@all
  end
  
    
  
  def self.find_or_create_by_name(name)
  #this method needs revision?
  #   if @@all == []
  #     return Artist.new(name)
  #   else
  #     @@all.each.with_index do |art, index|
  #       if @@all[index].name == name
  #         return @@all[index]
  #       else
  #         return Artist.new(name)
  #       end
  #     end
  #   end
  # end
  
  
    fin_obj = @@all.detect { |art_obj| art_obj.name == name } 
  
    if fin_obj.nil?
      Artist.new(name)
    else
      fin_obj
    end
  end
  
  def print_songs
    self.songs.each { |x| puts x.name}
  end
  
  
end