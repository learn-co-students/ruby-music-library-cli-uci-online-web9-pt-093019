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

  def find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      return song
    else
      Song.create(name)
    end #end of if block
  end #end of method



end
