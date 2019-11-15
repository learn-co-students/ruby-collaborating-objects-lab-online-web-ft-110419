require 'pry'
class MP3Importer
  
  attr_accessor :path
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    file_list = Dir.entries(@path).grep(/.+\.mp3\b/)
  end
  
  def import
    self.files.each {|file| Song.new_by_filename(file)}
  end
  
end