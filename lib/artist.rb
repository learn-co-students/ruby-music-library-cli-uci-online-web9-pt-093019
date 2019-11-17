require_relative '../lib/attributes.rb'

class Artist < Attributes
  attr_accessor :songs
  extend Concerns::Findable

  def initialize(name)
    super # build on parent method :)
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.collect{ |song| song.genre }.uniq
  end #end of method

end #end of class
