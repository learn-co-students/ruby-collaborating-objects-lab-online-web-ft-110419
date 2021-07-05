class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    @songs = Song.all.select { |song| song.artist == self  }
  end


  def add_song_by_name(song_name)
    Song.new(song_name).artist = self
  end

  def self.song_count
    Song.all.count
  end

  def self.find_or_create_by_name(artist_name)
    if self.all.find {|artist| artist.name == artist_name} == nil
      Artist.new(artist_name)
    else
      self.all.find {|artist| artist.name == artist_name}
    end
  end

  def print_songs
    songs.each {|song| puts song.name}
  end
end
