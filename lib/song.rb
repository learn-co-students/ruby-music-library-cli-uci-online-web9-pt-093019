require_relative '../lib/attributes.rb'

class Song < Attributes
  attr_accessor :artist

  def initialize(name, artist = nil) # overwrite parent method :(
    @name = name
    @artist = artist unless artist == nil
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
