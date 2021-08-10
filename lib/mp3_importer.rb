class MP3Importer
    attr_reader :path

    def initialize(music_path)
        @path = music_path
    end

    def files 
        # parses the files in the path, returning an array that contains the file names. 
        # Make sure you only get .mp3 files.
        Dir.entries(@path).select {|i| i[/\.mp3$/]}
    end

    def import
        # sends the song names to the Song class. Specifically, the method should call Song.new_by_filename, 
        # which will handle the creation of Song instances and their associated Artist instances
        files.each do |file|
            Song.new_by_filename(file)
        end
    end

end