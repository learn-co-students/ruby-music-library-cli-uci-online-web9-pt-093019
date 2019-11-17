#require_relative '../lib/attributes.rb'

class Genre #< Attributes
  extend Concerns::Findable
  attr_accessor :songs, :name
  @@all = []

  def initialize(name)
  #  super
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

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end



end
