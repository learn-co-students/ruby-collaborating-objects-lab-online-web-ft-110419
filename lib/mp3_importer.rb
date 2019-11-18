require './lib/song.rb' 

class MP3Importer
  attr_accessor :path
    
  def initialize(filepath)
   @path = filepath
   files
  end
  
  def files
    #@files = Dir.glob("#{@path}/**/*.mp3")
    @files = Dir.entries(@path).select {|f| !File.directory? f}
    #binding.pry
    
  end
  
  def import
    @files.each { |filename| Song.new_by_filename(filename) }
  end
  
  
  
  
  
  
  
end 