##initialize accepts a file path to parse mp3 files from
##files loads all the mp3 files in the path directory
##files normalizes the filename to just the mp3 filename with no path
##import imports the files into the library by creating songs from a filename
class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    files = Dir.entries(@path).select {|x| x.include?("mp3")}
  end
  def import
    self.files.each {|file| Song.new_by_filename(file)}
  end
end
