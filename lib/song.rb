
class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name, artist=nil, genre=nil)
      song = Song.new(name)
      song.save
      song
  end

  def artist=(artist)
    #binding.pry
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    #binding.pry
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def self.find_by_name(song_name)
    Song.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
     if !self.find_by_name(song_name)
       self.create(song_name)
     else
       self.find_by_name(song_name)
     end
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre_name = filename.split(" - ")[2].gsub(".mp3","")
    song = Song.new(song_name)
    song.artist= Artist.find_or_create_by_name(artist_name)
    song.genre= Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end
end
