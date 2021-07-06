require 'pry'
class MP3Importer

attr_accessor :path

  def initialize(path)
  @path = path
  end

  def files
  Dir.entries('spec/fixtures/mp3s').sort[2..5]
  #https://stackoverflow.com/questions/1755665/get-names-of-all-files-from-a-folder-with-ruby
  end

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end

end
