#require_relative '../lib/attributes.rb'

class Song #< Attributes

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
    self.save
  end

  ## Class Methods ##
  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    self.new(name)
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
  self.new_from_filename(file)
  end

  ## Instance Methods ##

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end


end #end of class
