class Song 
  attr_accessor :name, :artist 
  @@all
  
  def initialize(name, artist)
    @name = name 
    @artist = artist 
    @@all 
  end
  
  
  
  def self.all
    @@all 
  end 
  
  def self.new_by_filename(filename)
    
  end
  
 
  
end 
  
  