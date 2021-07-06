require "pry"
class MP3Importer
      attr_accessor:path
      
    def initialize(path)
        @path = path
        #binding.pry
    end
    def files
       Dir.entries(path).select {|entry|   entry.include?(".mp3")}
        
    end
    def import
      files.each {|filename| Song.new_by_filename(filename)}
    end
end