require_relative '../lib/attributes.rb'

class Artist < Attributes
  attr_accessor :songs

  def initialize(name)
    super # build on parent method :)
    @songs = []
  end

  def add_song(song)
    song.artist = self #unless song.artist.name.include?(@name)
    self.songs << song #unless self.songs.name.include?(song.name)
  end

end #end of class
