class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
    @files = Dir["#{@path}/**/*.mp3"]
  end
  
  def files
    i = 0
    while i < @files.size do
      @files[i] = @files[i].split('/').last
      i += 1
    end
    return @files
  end
  
  def import
    @files.each do |file|
      Song.new_by_filename(file)
    end
  end
end
