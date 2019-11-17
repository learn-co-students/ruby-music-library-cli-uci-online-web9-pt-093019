
#doesn't work for this project because artist, song, and genre all
#share the @@all array in this class :(
class Attributes
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    self.save
  end

  def save
    @@all << self
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
end
