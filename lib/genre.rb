require_relative '../lib/attributes.rb'

class Genre < Attributes
  attr_accessor :songs

  def initialize(name)
    super
    @songs = []
  end

  def artists
    artist_list = Song.all.collect do |song|
      song.genre == self unless artist_list.include(song.artist)
    end
  end



end
