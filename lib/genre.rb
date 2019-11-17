require_relative '../lib/attributes.rb'

class Genre < Attributes
  attr_accessor :songs
  extend Concerns::Findable

  def initialize(name)
    super
    @songs = []
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end



end
