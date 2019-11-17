#require_relative '../lib/attributes.rb'

class Artist #< Attributes
  extend Concerns::Findable
  attr_accessor :songs, :name
  @@all = []

  def initialize(name)
    #super # build on parent method :)
    @name = name
    self.save
    @songs = []
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

    ## Instance Methods ##

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.collect{ |song| song.genre }.uniq
  end #end of method

end #end of class
