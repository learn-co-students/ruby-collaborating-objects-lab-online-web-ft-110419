require "pry"
class MP3Importer
    attr_accessor :path
  
    
    def initialize(file_path)
      @path = file_path
    end
    
    def files
      Dir["#{@path}/*.mp3"].collect {|f| f[21..-1]}
    end
    
    def import 
      files.each{|f|
        Song.new_by_filename(f)
      }
    end
    
end
  