class MP3Importer 
  
  attr_accessor :path 
  
  def initialize(path)
    @path = path 
  end 
  
  def files
    #loads all mp3 files in path directory
    #normalizes file name with split to just filename, no path
    #@files = Dir.entries("#{path}/*.mp3").each {|file| require file}
    Dir[@path+"/*.mp3"].map { |file| file.split("/").last }
  end 
  
  def import 
    #imports files by creating songs from a filename
    #interacts with on new_by_filename
    #Song.new_by_filename
    files.each {|files| Song.new_by_filename}
  end 
  
end 