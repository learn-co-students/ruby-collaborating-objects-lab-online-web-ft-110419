require "pry"
class MP3Importer
attr_accessor :path , :name
  def initialize(path)
    @path = path
    @@all = []
  end
  def import
    files.each do |file| Song.new_by_filename(file)
end
  end
  def files
@files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }


  end
end
