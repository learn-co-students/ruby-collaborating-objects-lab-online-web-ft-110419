require 'pry'
require_relative '../env.rb'
class MP3Importer
  attr_accessor :path

  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
   Dir["#{@path}/*.mp3"].collect {|f| f[21..-1]}
  # binding.pry
  end
  
  def import 
    files.each {|file| Song.new_by_filename(file)}
  end
  
end
