class Song

    @@all = []

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        song_info = file.sub(/\.mp3/, "").split(" - ")
        new_song = Song.new(song_info[1])
        new_song.artist_name=(song_info[0])
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

end