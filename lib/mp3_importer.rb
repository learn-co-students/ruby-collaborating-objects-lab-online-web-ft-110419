require 'pry'
class MP3Importer
  attr_accessor :path

  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    # binding.pry
    Dir["/#{@path}/*.mp3"]
  end
  
  def import 
    
  end
  
end
