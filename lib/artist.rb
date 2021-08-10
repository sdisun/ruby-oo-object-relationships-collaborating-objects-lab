class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def songs 
        # This instance method returns an Array of all songs that belong to this Artist instance. This method should get all existing Song instances from Song and select only the ones that are associated with this Artist instance.
        Song.all.select {|song| song.artist && song.artist == self}
    end

    def add_song(song) 
        # This instance method exists to tell a passed in Song instance it belongs to this Artist instance.
        song.artist = self
    end

    def print_songs # This instance methods outputs the names of all songs associated with this Artist instance.
        songs.each {|song| puts song.name}
    end

    def self.find_or_create_by_name(name)
        artist = @@all.find {|artist| artist.name = name}
        artist = self.new(name) if !artist
        artist
    end

    def self.all # This class method should return all Artist instances.
        @@all
    end
end
