require_relative '../lib/attributes.rb'

class Artist < Attributes
  attr_accessor :songs

  def initialize(name)
    super # build on parent method :)
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    genres_array = []
    Song.all.each do |song|
       if song.artist == self && !genres_array.include?(song.genre)
         genres_array << song.genre
       end
     end
  end

end #end of class
