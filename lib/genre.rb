class Genre

    extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        # self.all.clear
        all.clear
    end

    def save
        Genre.all << self
        #self.class.all << self
    end

    def self.create(name)
        genre = Genre.new(name)
        genre.save
        genre
    end

    # def artists
    #     self.all.map {|artist| artist.genre == self}
    # end

    def artists
        songs.collect {|song| song.artist}.uniq
    end

end