require_relative '../lib/attributes.rb'

class Song < Attributes
  attr_reader :artist, :genre

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def initialize(name, artist = nil, genre = nil) # overwrite parent method :(
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
    self.save
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      return song
    else
      Song.create(name)
    end #end of if block
  end #end of method

  def self.new_from_filename(file)
    array = file.split(" - ")
    artist = Artist.find_or_create_by_name(array[0])
    song_name = array[1]
    genre = Genre.find_or_create_by_name(array[2].split(".")[0])
    new_song = Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
  #  array = file.split(" - ")
  #  artist = Artist.find_or_create_by_name(array[0])
  #  song_name = array[1]
  #  genre = Genre.find_or_create_by_name(array[2].split(".")[0])
  #  new_song = Song.new(song_name, artist, genre)
  self.new_from_filename(file)
  end

end #end of class
